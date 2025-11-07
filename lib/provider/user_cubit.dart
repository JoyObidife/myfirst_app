import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirst_app/data/dummy_user_details.dart';
import 'package:myfirst_app/model/user_detail.dart';


class UserCubit extends Cubit<UserDetail?>{
   UserCubit(): super(null);
   UserDetail? loggedInUser;


void login(BuildContext context, String email, String password) async{
  Future.delayed(Duration(seconds: 2));

  

  for(var userDetail in USER_DETAILS) {
    if(userDetail.email == email && userDetail.password == password) {
      
      emit(userDetail);
      Navigator.of(context).pushReplacementNamed("/home");
    }

    
  }

  

}

void signup(String username, String email, BuildContext context) {
 loggedInUser = UserDetail(name: username, email: email, profilePicture: "", password: "");
  USER_DETAILS.add(loggedInUser!);
  Navigator.pushReplacementNamed(context, "/home");

 
}
 
}