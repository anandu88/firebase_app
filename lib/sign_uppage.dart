import 'package:firebase_app/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Container(width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text("create new account",
                  style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
                  ),
                  SizedBox(height: 50,),
                  TextField(controller: emailcontroller,
                    decoration: InputDecoration(hintText: "email address",
                    prefixIcon: Icon(Icons.email,color: Colors.deepPurple,),
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                       )
                    ),
                  ),
                   SizedBox(height: 20,),
                  TextField(controller: passwordcontroller,
                  obscureText: true,
                    decoration: InputDecoration(hintText: "password",
                    prefixIcon: Icon(Icons.password,color: Colors.deepPurple,),
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                       )
                    ),
                  ),
                  
                 
                  SizedBox(height: 25,),
          Center(
            child: GestureDetector(
              onTap: () {
                AuthController.instance.register(emailcontroller.text.trim(), passwordcontroller.text.trim());
              },
              child: Container(height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade400
              ),
                      
                child:
                 Center(child: 
                 Text("sign up",style: TextStyle(fontSize: 26,
                fontWeight: FontWeight.bold,color: Colors.white),))),
            ),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Already have an account?",style: TextStyle(
                color: Colors.grey[500]
              ),),
              TextButton(onPressed: (){
                Get.back();
              }, child: Text("login here"))
            ],
          ),
          SizedBox(height: 50,),
          Center(
            child: Text("signup using one of the following",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500]
            ),),
          ),SizedBox(height: 30,),
          Center(
            child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap:() {
                  AuthController(). signinwithgoogle();
                }, 
                  child: CircleAvatar(radius: 30,backgroundColor: Colors.grey[500],
                    child: CircleAvatar(radius: 25,backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/1298745_google_brand_branding_logo_network_icon.png"),
                    ),
                  ),
                ),
                 CircleAvatar(radius: 30,backgroundColor: Colors.grey[500],
                  child: CircleAvatar(radius: 25,backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/317720_social media_tweet_twitter_social_icon.png"),
                  ),
                ),
                 CircleAvatar(radius: 30,backgroundColor: Colors.grey[500],
                  child: CircleAvatar(radius: 25,backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/317752_facebook_social media_social_icon.png"),
                  ),
                )
              ],
            ),
          )
                ],
              ),),
        ),
      ),
    );
  }
}