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
            Expanded(
              child: Padding(
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
                      name: "Saurabh",
                      amount: 500,
                      colour: Colors.lightBlueAccent,
                    ),
                    TransactionList(
                      name: "Shouryaa",
                      amount: 100,
                      colour: Colors.blueAccent,
                    ),
                    TransactionList(
                      name: "Najma",
                      amount: 700,
                      colour: Colors.lightBlueAccent,
                    ),
                    TransactionList(
                      name: "Singh",
                      amount: 300,
                      colour: Colors.blueAccent,
                    ),
                    TransactionList(
                      name: "Ram",
                      amount: 500,
                      colour: Colors.lightBlueAccent,
                    ),
                    TransactionList(
                      name: "Shyam",
                      amount: 100,
                      colour: Colors.blueAccent,
                    ),
                    TransactionList(
                      name: "Ganga",
                      amount: 700,
                      colour: Colors.lightBlueAccent,
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
