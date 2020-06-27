import 'package:VisaPay/components/alertDialog.dart';
import 'package:VisaPay/components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:VisaPay/components/constants.dart';
import 'package:sms/sms.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;
final firestoreUser = Firestore.instance.collection('cardDetails');

class PaymentLinkScreen extends StatefulWidget {
  @override
  _PaymentLinkScreenState createState() => _PaymentLinkScreenState();
}

class _PaymentLinkScreenState extends State<PaymentLinkScreen> {
  String link = ' ';
  String amount;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String recipentNumber = '';
  bool notSaved = false;
  Color colour = Colors.grey;

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
        try {
          final DocumentSnapshot doc =
              await firestoreUser.document(loggedInUser.email).get();

          setState(() {
            cardNumber = doc.data['number'];
            expiryDate = doc.data['expiry'];
            cardHolderName = doc.data['name'];
            cvvCode = doc.data['cvv'];
          });
        } catch (e) {
          setState(() {
            notSaved = true;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialogEroor(context, message);
      },
    );
  }

  void successMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialogSuccess(
          context,
          message,
        );
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
          title: Text("VisaPay"),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
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
                          decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Amount'),
                        ),
                        RoundedButton(
                          title: 'Generate QR code and Link',
                          colour: Colors.blueAccent,
                          onPressed: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            if (amount == null) {
                              errorMessage("Please enter amount.");

                              setState(() {
                                colour = Colors.grey;
                                link = ' ';
                              });
                            } else if (notSaved)
                              errorMessage(
                                  "Card details not found or check your internet connectivity.");
                            else {
                              setState(() {
                                colour = Colors.green;
                                link = "Success";
                                amount = null;
                              });
                              successMessage("Link successfully generated.");
                            }
                          },
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
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            if (colour == Colors.green) {
                              Navigator.pushNamed(context, 'qrcode_screen');
                            } else {
                              errorMessage("Link not generated yet");
                            }
                          },
                          child: Text(
                            'Get QR code Image',
                            style: TextStyle(
                              color: colour,
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
                          onChanged: (value) {
                            recipentNumber = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Recipent Mobile Number'),
                        ),
                        RoundedButton(
                          title: 'Send',
                          colour: Colors.blueAccent,
                          onPressed: () {
                            if (recipentNumber.length != 10)
                              errorMessage(
                                  'Number not correct or link not generated yet');
                            else {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              SmsSender sender = new SmsSender();

                              SmsMessage message =
                                  new SmsMessage(recipentNumber, link);

                              message.onStateChanged.listen((state) {
                                if (state == SmsMessageState.Sent) {
                                  successMessage("SMS is sent.");
                                } else if (state == SmsMessageState.Delivered) {
                                  successMessage("SMS is delivered!");
                                }
                              });

                              sender.sendSms(message);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
