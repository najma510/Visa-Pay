import 'package:flutter/material.dart';
import 'package:VisaPay/components/TaskList.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
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
          padding: EdgeInsets.only(top: 10, left: 24, right: 24),
          child: Column(
            children: [
              Container(
                height: 100.0,
                child: Image.asset('images/visa.png'),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      TaskTile(
                        taskTitle: "Chiken Burger",
                        colour: Colors.blueAccent,
                      ),
                      TaskTile(
                        taskTitle: "Pizza",
                        colour: Colors.lightBlueAccent,
                      ),
                      TaskTile(
                        taskTitle: "Chiken Fry",
                        colour: Colors.blueAccent,
                      ),
                      TaskTile(
                        taskTitle: "Fries",
                        colour: Colors.lightBlueAccent,
                      ),
                      TaskTile(
                        taskTitle: "Shake",
                        colour: Colors.blueAccent,
                      ),
                      TaskTile(
                        taskTitle: "Butter Chiken",
                        colour: Colors.lightBlueAccent,
                      ),
                      TaskTile(
                        taskTitle: "Garlic Nan",
                        colour: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
              ),
              RoundedButton(
                title: 'Place Order and Pay',
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, 'payment_screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
