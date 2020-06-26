import 'package:VisaPay/components/alertDialog.dart';
import 'package:VisaPay/components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;
final firestoreUser = Firestore.instance.collection('cardDetails');

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool notSaved = true;

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
          notSaved = false;
          cardNumber = doc.data['number'];
          expiryDate = doc.data['expiry'];
          cardHolderName = doc.data['name'];
          cvvCode = doc.data['cvv'];
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
        appBar: AppBar(
          leading: null,
          title: Text("VisaPay"),
          backgroundColor: Colors.blueAccent,
        ),
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: CreditCardForm(
                      onCreditCardModelChange: onCreditCardModelChange,
                      themeColor: Colors.blueAccent,
                      textColor: Colors.blueAccent,
                      cursorColor: Colors.blueAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: RoundedButton(
                    title: 'Save Credentials',
                    colour: Colors.blueAccent,
                    onPressed: () {

                      if (cvvCode == '' ||
                          cardHolderName == '' ||
                          cardNumber == '' ||
                          expiryDate == '') {

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alertDialogEroor(
                              context,
                              "One or more inputs are empty.",
                            );
                          },
                        );
                      } else {

                        if (notSaved) {
                          firestoreUser.document(loggedInUser.email).setData(
                            {
                              'number': cardNumber,
                              'expiry': expiryDate,
                              'cvv': cvvCode,
                              'name': cardHolderName,
                            },
                          );
                        } else {
                          firestoreUser
                              .document(loggedInUser.email)
                              .updateData(
                            {
                              'number': cardNumber,
                              'expiry': expiryDate,
                              'cvv': cvvCode,
                              'name': cardHolderName,
                            },
                          );
                        }

                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(
      () {
        cardNumber = creditCardModel.cardNumber;
        expiryDate = creditCardModel.expiryDate;
        cardHolderName = creditCardModel.cardHolderName;
        cvvCode = creditCardModel.cvvCode;
        isCvvFocused = creditCardModel.isCvvFocused;
      },
    );
  }
}
