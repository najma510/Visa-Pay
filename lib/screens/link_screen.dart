import 'package:VisaPay/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:VisaPay/components/constants.dart';

class PaymentLinkScreen extends StatefulWidget {
  @override
  _PaymentLinkScreenState createState() => _PaymentLinkScreenState();
}

String link = "https://www.google.co.in/";
String amount;

class _PaymentLinkScreenState extends State<PaymentLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: null,
          title: Text("VisaPay"),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100.0,
                child: Image.asset('images/visa.png'),
              ),
              SizedBox(height: 60.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: (value) {
                          amount = value;
                        },
                        decoration:
                            kTextFieldDecoration.copyWith(labelText: 'Amount'),
                      ),
                      RoundedButton(
                        title: 'Generate QR code and Link',
                        colour: Colors.blueAccent,
                        onPressed: () {},
                      ),
                      SizedBox(height: 50.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 4.0,
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.link,
                              ),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                            Expanded(
                              child: Text(
                                link,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.share,
                              ),
                              color: Colors.black,
                              onPressed: () => share(context, link),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'NOTE: This link expires in 10 minutes. Please ensure to clear the payment before the due time',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'qrcode_screen');
                        },
                        child: Text(
                          'Get QR code Image',
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        'Send as Text Message',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 27,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: kTextFieldDecoration.copyWith(
                            labelText: 'Recipent Mobile Number'),
                      ),
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
