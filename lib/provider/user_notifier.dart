import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:myfirst_app/model/user_detail.dart';

class UserNotifier extends ChangeNotifier {
  UserDetail? loggedInUser;

  void login(String email, String password, BuildContext context) async {
    try {
      // create user on firebase
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      loggedInUser = UserDetail(
        name: "name",
        profilePicture: "profilePicture",
        email: user.user!.email!,
        
      ); // Take user to home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    notifyListeners();
  }

  void signup(String username, String email, BuildContext context) {
    loggedInUser = UserDetail(name: username, email: email, profilePicture: "");

    notifyListeners();
  }

  Future<void> signUp({
    required BuildContext context,
    required String userName,
    required String password,
    required String email,
  }) async {
    try {
      // create user on firebase
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // Alert user on success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User $userName has been created successfully")),
      );
      // Take user to home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
