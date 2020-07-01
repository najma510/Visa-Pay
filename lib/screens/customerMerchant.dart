import 'package:VisaPay/components/alertDialog.dart';
import 'package:VisaPay/components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;
final firestoreUser = Firestore.instance.collection('users');

class OptionScreen extends StatefulWidget {
  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  String messageText;
  String email = ' ';
  String name = ' ';

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        final DocumentSnapshot doc =
            await firestoreUser.document(loggedInUser.email).get();

        setState(() {
          email = doc.data['email'];
          name = doc.data['name'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> onBackPressed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: null,
          title: Text(
            'VisaPay',
          ),
          actions: <Widget>[
            GestureDetector(
              child: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                _auth.signOut();
                Navigator.popAndPushNamed(context, 'login_screen');
              },
            ),
          ],
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: WillPopScope(
            onWillPop: onBackPressed,
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 100.0,
                    child: Image.asset('images/visa.png'),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Flexible(
                    child: Text(
                      "Hello There.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 50,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 40,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  RoundedButton(
                    title: 'Enter as a Merchant',
                    colour: Colors.blueAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, 'merchant_screen');
                    },
                  ),
                  RoundedButton(
                    title: 'Enter as a Consumer',
                    colour: Colors.blueAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, 'consumer_screen');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
