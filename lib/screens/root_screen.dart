import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then(
      (res) {
        if (res != null) {
          Navigator.popAndPushNamed(context, 'consumer_screen');
        } else {
          Navigator.popAndPushNamed(context, 'login_screen');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
