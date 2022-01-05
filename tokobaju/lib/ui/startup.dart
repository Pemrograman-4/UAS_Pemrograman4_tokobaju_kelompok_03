import 'dart:async';

import 'package:tokobuku/ui/home.dart';
import 'package:tokobuku/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  void Pref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isLogin") == true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => homepage()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => loginview()));
    }
  }

  startTime() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, Pref);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icon.png'),
              const Padding(padding: EdgeInsets.only(top: 25.0)),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
