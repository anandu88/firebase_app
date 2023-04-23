import 'package:firebase_app/auth_controller.dart';
import 'package:firebase_app/sign_uppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    var emailcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: [
            
            Container(width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello",style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
                  Text("sign into your account",
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey[500]),
                  ),
                  SizedBox(height: 50,),
                  TextField(controller: emailcontroller,
                    decoration: InputDecoration(hintText: "email",
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
                  SizedBox(height: 20,),
                  Row(children: [
                    Expanded(child:Container(),
                    ),
                    Text("sign into your account",
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey[500])),
                  ],)
                ],
              ),
            ),SizedBox(height: 25,),
            GestureDetector(
              onTap: () {
                AuthController.instance.login(emailcontroller.text.trim(), passwordcontroller.text.trim());
              },
              child: Container(height: 70,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade400
              ),
              
                child: Center(child: Text("sign in",style: TextStyle(fontSize: 36,
                fontWeight: FontWeight.bold,color: Colors.white),))),
            ),
              SizedBox(
                height: 30,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(color: Colors.grey[500]),),
                  TextButton(onPressed: (){Get.to(()=>Signup());
                    
                  }, child: Text("Create new"))
                ],
              )
          ],
          ),
        ),
      ),
    );
  }
}