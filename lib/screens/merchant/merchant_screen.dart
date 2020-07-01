import 'package:VisaPay/components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;
final firestoreUser = Firestore.instance.collection('users');

class MerchantScreen extends StatefulWidget {
  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  String messageText;
  String email = ' ';
  String name = ' ';
  int pageId = 0;

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
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 10),
            child: ListView(
              children: [
                Container(
                  height: 100.0,
                  child: Image.asset('images/visa.png'),
                ),
                SizedBox(
                  height: 100,
                ),
                CircularProfileAvatar(
                  '',
                  child: Image.asset('images/pro.png'),
                  borderWidth: 5,
                  elevation: 2,
                  radius: 80,
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 35,
                    fontFamily: "Signatra",
                  ),
                ),
                Text(
                  email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RoundedButton(
                  title: 'Generate Shareable Payment Link',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'link_screen');
                  },
                ),
                RoundedButton(
                  title: 'View Transaction History',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'transaction_screen');
                  },
                ),
                RoundedButton(
                  title: 'View/Edit Card Details',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'card_screen');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
