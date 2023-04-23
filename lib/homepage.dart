import 'package:firebase_app/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Homepage extends StatelessWidget {
  String email;
   Homepage({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Hello",style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
           Row(
             children: [
               Text("WELCOME",
          style: TextStyle(fontSize:30,
          fontWeight: FontWeight.w300,
                color: Colors.black
          ),),
          Text(
            email,style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w300
            ),
          )
             ],
           ),
          GestureDetector(
            onTap: () {
              AuthController.instance.logout();
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(child: Text("sign out")),
            ),
          )

        ],
      ),
    );
  }
}