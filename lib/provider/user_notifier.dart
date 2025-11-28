import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:myfirst_app/model/user_detail.dart';

class UserNotifier extends ChangeNotifier {
  UserDetail? loggedInUser;

  void login(String email, String password, BuildContext context) async {
    try {
      // create user on firebase
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      
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

  // void signup(String username, String email, BuildContext context) {
  //   loggedInUser = UserDetail(name: username,  email: email, profilePicture: "",phoneNumber: "", address: "", occupation: "");

  //   notifyListeners();
  // }

  Future<void> signUp({
    required BuildContext context,
    required String userName,
    required String password,
    required String email,
  }) async {
    try {
      // create user on firebase auth
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // create userdetail object
      var userDetail = UserDetail(email: email, name: userName);

      // store user to firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .set(userDetail.toJson());

      loggedInUser = userDetail;

      notifyListeners();

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

  void signInWithGoogle(BuildContext context) async {
    try {
      var instance = GoogleSignIn.instance;

      final GoogleSignInAccount googleUser = await instance.authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      //Create a new Credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential user = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      // create userdetail object
      var userDetail = UserDetail(
        email: user.user!.email!,
        name: user.user!.displayName ?? "No name",
        profilePicture: user.user!.photoURL ?? "",
      );

      // store user to firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userDetail.email)
          .set(userDetail.toJson());

      loggedInUser = userDetail;
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

  void forgotPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
