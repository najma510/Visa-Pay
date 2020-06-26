import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Transaction History",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 35,
                  fontFamily: "Signatra",
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TransactionList(
                name: "Saurabh Kumar",
                amount: 500,
                colour: Colors.lightBlueAccent,
              ),
              TransactionList(
                name: "Shouryaa",
                amount: 1000,
                colour: Colors.blueAccent,
              ),
              TransactionList(
                name: "Najma Mehabub",
                amount: 559,
                colour: Colors.lightBlueAccent,
              ),
              TransactionList(
                name: "Singh Singh",
                amount: 299,
                colour: Colors.blueAccent,
              ),
              TransactionList(
                name: "Mukul Tewathia",
                amount: 3500,
                colour: Colors.lightBlueAccent,
              ),
              TransactionList(
                name: "Neeraj Parihar",
                amount: 399,
                colour: Colors.blueAccent,
              ),
              TransactionList(
                name: "Nitin Chawla",
                amount: 77,
                colour: Colors.lightBlueAccent,
              ),
              TransactionList(
                name: "Robin Singh",
                amount: 1999,
                colour: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final String name;
  final int amount;
  final Color colour;

  TransactionList({this.name, this.amount, this.colour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "\$ $amount",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
