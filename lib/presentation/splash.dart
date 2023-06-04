// import 'dart:async';
// import 'dart:js';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pcet_placements/presentation/auth/widgets/authentication_page.dart';
// import 'package:practice1/LoginScreen.dart';

// Future<Timer> loadDate() async{
//   return Timer(Duration(seconds: 3),onDoneLoading);

// }
// onDoneLoading(){
//   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=> LoginScreen))
// }

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthenticationPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/trust-logo.jpg',
                  height: 200,
                  width: 200,
                ),
                const Text(
                  "A trusted brand since 1990",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ]),
        ),
      ),
    );
  }
}
