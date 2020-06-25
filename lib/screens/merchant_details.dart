import 'package:VisaPay/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

FirebaseUser loggedInUser;

class MerchantScreen extends StatefulWidget {
  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

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
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right:12.0),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: ListView(
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/visa.png'),
              ),
            ),
            CircularProfileAvatar(
              '',
              child: Image.asset('images/pro.png'),
              borderWidth: 5,
              elevation: 2,
              radius: 80,
            ),
            Text(
              "Saurabh Kumar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 30,
                  fontFamily: "Signatra"),
            ),
            Text(
              "xyz@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            RoundedButton(
              title: 'Generate QR Code',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, 'qrcode_screen');
              },
            ),
            RoundedButton(
              title: 'Generate Shareable Payment Link',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, 'paymentLink_screen');
              },
            ),
            RoundedButton(
              title: 'View Transaction History',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, 'transaction_screen');
              },
            ),
            RoundedButton(
              title: 'View/Edit Card Details',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, 'card_details');
              },
            ),
          ],
        ),
      ),
    );
  }
}
