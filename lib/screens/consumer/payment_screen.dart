import 'package:flutter/material.dart';
import 'package:VisaPay/components/alertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rich_alert/rich_alert.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;
final firestoreUser = Firestore.instance.collection('cardDetails');

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String recipentNumber = '';

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
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
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
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: ListView(
          children: [
            Container(
                height: 50.0,
                width: 500.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: Colors.grey,
                ),
                child: Center(
                  child: Text(
                    'Payment Details',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                )),
            Container(
                height: 800.0,
                width: 500.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.only(left: 10.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('MERCHANT:   McDonalds',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 10.0),
                    Text('MERCHANT PAN:   156436744785',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 10.0),
                    Text('MERCHANT ADDRESS:   Mumbai',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 30.0),
                    Text(
                      'SHOPPING CART:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Burger         \$200",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Pizza           \$100",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Momos         \$50",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Total Amount:        \$350',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'CARD NUMBER',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50.0,
                      width: 250.0,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Center(
                          child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            size: 30.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            cardNumber,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.lock,
                            size: 20.0,
                            color: Colors.black,
                          ),
                        ],
                      )),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      children: <Widget>[
                        Text(
                          'EXPIRY DATE',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 60.0),
                        Text(
                          'CVV',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 120.0,
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Center(
                              child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.date_range,
                                size: 30.0,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                expiryDate,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          )),
                        ),
                        SizedBox(width: 50.0),
                        Container(
                          height: 50.0,
                          width: 100.0,
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Center(
                            child: Text(
                              cvvCode,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'CARD HOLDERNAME',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50.0,
                      width: 250.0,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 30.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            cardHolderName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100.0,
                      width: 500.0,
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return RichAlertDialog(
                                    alertTitle:
                                        richTitle("Transaction Successful"),
                                    alertSubtitle: richSubtitle(
                                        "Your Visa Checkout Transaction was successful"),
                                    alertType: RichAlertType.SUCCESS,
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Image.asset(
                            'images/VisaCheckout.jpg',
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
