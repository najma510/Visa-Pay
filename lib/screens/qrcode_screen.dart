import 'package:flutter/material.dart';

class QRcodeScreen extends StatefulWidget {
  @override
  _QRcodeScreenState createState() => _QRcodeScreenState();
}

class _QRcodeScreenState extends State<QRcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          title: Text("VisaPay"),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/qrcode.png'),
                      SizedBox(
                        height:5,
                      ),
                      Text(
                        "For payment page scan above QR code",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
