import 'package:VisaPay/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class MerchantScreen extends StatefulWidget {
  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: ListView(
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/visa.png'),
                ),
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
              "Anonymous",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
              ),
            ),
            Text(
              "XYZ Pvt. Lmtd",
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
              onPressed: () {},
            ),
            RoundedButton(
              title: 'Generate Shareable Payment Link',
              colour: Colors.lightBlueAccent,
              onPressed: () {},
            ),
            RoundedButton(
              title: 'View Transaction History',
              colour: Colors.lightBlueAccent,
              onPressed: () {},
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
