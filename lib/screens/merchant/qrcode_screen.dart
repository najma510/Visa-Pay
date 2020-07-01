import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Flexible(
                        child: QrImage(
                          data:
                              "http://localhost:8080/b8b038a41b89d0662d591bd4380261c55cde5d962344aac4d9235fe1268df96f1a2f4d3s2d",
                          version: QrVersions.auto,
                          size: 400,
                          gapless: false,
                        ),
                      ),
                      Text(
                        "For payment page scan above QR code",
                        textAlign : TextAlign.center,
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
