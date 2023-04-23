

import 'package:firebase_app/homepage.dart';
import 'package:firebase_app/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController{
  static AuthController instance=Get.find();
  late Rx<User?>_user;
  FirebaseAuth auth=FirebaseAuth.instance;


  @override
  void onReady(){
    super.onReady();
    _user=Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _intialscreen);

  }


  _intialscreen(User?user){
    if(user==null){
      Get.offAll(()=>Loginpage());
    }else{
      Get.offAll(()=>Homepage(email:user.email!));
    }



  }
  void register(String email,password){
   try{
     auth.createUserWithEmailAndPassword(email: email, password: password);
   }catch(e){
    Get.snackbar("about user", "user message",
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text("Account creation failed",
    style: TextStyle(
      color: Colors.black
    ),),
    messageText: Text(e.toString(),style: TextStyle(color: Colors.black),),
    backgroundColor: Colors.deepPurpleAccent


    );

   }

  }
  void login(String email,password){
   try{
     auth.signInWithEmailAndPassword(email: email, password: password);
   }catch(e){
    Get.snackbar("about login", "login message",
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text("login failed",
    style: TextStyle(
      color: Colors.white
    ),),
    messageText: Text(e.toString(),style: TextStyle(color: Colors.black),),
    backgroundColor: Colors.deepOrange


    );

   }

  }
  void logout()async{
    await auth.signOut();
  }
   signinwithgoogle()async{
    //trigger the authentication flow
    final GoogleSignInAccount?googleUser=await GoogleSignIn(
      scopes: <String>["email"]
    ).signIn();
    
    //obtain the auth details from the request
    final GoogleSignInAuthentication googleauth=await googleUser!.authentication;


    //create new credential
    final credential=GoogleAuthProvider.credential(
      accessToken: googleauth.accessToken,
      idToken: googleauth.idToken
    ); 
    
    //once sign in return user credential
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
}