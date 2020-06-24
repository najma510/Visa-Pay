import 'package:VisaPay/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../constants.dart';

class PaymentLinkScreen extends StatefulWidget {
  @override
  _PaymentLinkScreenState createState() => _PaymentLinkScreenState();
}

String link = "https://www.google.co.in/";

class _PaymentLinkScreenState extends State<PaymentLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/visa.png'),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 5.0,
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.link),
                            color: Colors.black,
                            onPressed: () {},
                          ),
                          Expanded(
                            child: Text(
                              link,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.share),
                            color: Colors.black,
                            onPressed: () => share(context, link),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'NOTE: This link expires in 10 minutes. Please ensure to clear the payment before the due time',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 80.0),
                    Text(
                      'Send as Text Message',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                    ),
                    SizedBox(height: 30.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,),
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Recipent Mobile Number'),
                    ),
                    SizedBox(height: 10.0),
                    RoundedButton(
                      title: 'Send',
                      colour: Colors.blueAccent,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void share(BuildContext context, String link) {
  final RenderBox box = context.findRenderObject();

  Share.share(
    link,
    subject: link,
    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
  );
}
