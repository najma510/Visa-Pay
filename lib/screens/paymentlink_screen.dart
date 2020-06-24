import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PaymentLinkScreen extends StatefulWidget {
  @override
  _PaymentLinkScreenState createState() => _PaymentLinkScreenState();
}

String link ="https://www.google.co.in/";

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
                      height: 130.0,
                      child: Image.asset('images/check.png'),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Hi Merchnat your link is successfully Created",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'signatra',
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Click Here To Share Or Copy Your Link",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () => share(context, link),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Note: Link will expire in next 15 minutes",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                      ),
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
