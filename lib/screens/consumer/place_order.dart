import 'package:flutter/material.dart';
import 'package:VisaPay/components/alertDialog.dart';
import 'package:VisaPay/components/rounded_button.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  Map<String, bool> options = {
    'Burger': false,
    'Pizza': false,
    'Momos': false,
    'Sandwich': false,
    'French Fries': false,
  };
  getItems() {
    options.forEach((key, value) {
      return key;
    });
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
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 10),
          child: ListView(
            children: [
              Container(
                height: 100.0,
                child: Image.asset('images/visa.png'),
              ),
              SizedBox(
                height: 100,
              ),
              // RoundedButton(
              //   title: 'Place Order and Pay',
              //   colour: Colors.blueAccent,
              //   onPressed: () {
              //     Navigator.pushNamed(context, 'card_screen');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
