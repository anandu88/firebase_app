import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: Container(height: 100,
          width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}