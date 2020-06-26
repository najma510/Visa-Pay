import 'package:VisaPay/components/alertDialog.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:VisaPay/components/constants.dart';

final _auth = FirebaseAuth.instance;
final firestoreUser = Firestore.instance.collection('users');

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email, password, name;

  Future<bool> onBackPressed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog(context);
      },
    );
  }

  void errorMessage() {
    setState(() {
      showSpinner = false;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialogEroor(
            context, "Something went wrong. Please try again.");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: WillPopScope(
          onWillPop: onBackPressed,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Hero(
                          tag: 'logo',
                          child: Container(
                            height: 30.0,
                            child: Image.asset('images/visa.png'),
                          ),
                        ),
                      ),
                      TypewriterAnimatedTextKit(
                        text: ['Register'],
                        speed: Duration(milliseconds: 800),
                        repeatForever: true,
                        textStyle: TextStyle(
                          fontSize: 50.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                      decoration:
                          kTextFieldDecoration.copyWith(labelText: 'Name'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                      decoration:
                          kTextFieldDecoration.copyWith(labelText: 'Email'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Password',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Atleast 6 characters',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        if (name == null)
                          errorMessage();
                        else {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newUser != null) {
                              firestoreUser.document(email).setData({
                                'email': email,
                                'name': name,
                              });

                              Navigator.popAndPushNamed(
                                  context, 'merchant_details');
                            }
                          } catch (e) {
                            errorMessage();
                          }
                        }
                      },
                      child: Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blueAccent,
                          color: Colors.blue,
                          elevation: 7.0,
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.popAndPushNamed(
                                context, 'login_screen');
                          },
                          child: Center(
                            child: Text(
                              'Go Back',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
