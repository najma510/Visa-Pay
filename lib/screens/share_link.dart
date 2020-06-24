import 'package:VisaPay/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../constants.dart';

class LinkShareScreen extends StatefulWidget {
  @override
  LinkShareScreenState createState() => LinkShareScreenState();
}

class LinkShareScreenState extends State<LinkShareScreen> {
  bool showSpinner = false;
  int mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 150.0,
                child: Image.asset('images/visa.png'),
              ),
              Container(
                height: 60.0,
                width: 400.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 5.0,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.link), color: Colors.black,
                      onPressed: (){},
                    ),
                    Text(
                      'developer.visa.com',
                    ),
                    IconButton(
                      icon: Icon(Icons.share), color: Colors.black,
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.content_copy), color: Colors.black,
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'NOTE: This link expires in 10 minutes. Please ensure to clear the payment before the due time',
                 style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 20.0),
              Text(
                  'Send as Text Message',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 27),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Text(
                    'Recipient Mobile Number',
                    style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 30.0),
              TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  //onChanged: (value) {mobile = value;},
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Mobile Number'),
                ),
                SizedBox(height: 30.0),
                RoundedButton(
                  title: 'Send',
                  colour: Colors.blueAccent,
                  onPressed: () {},
                ),
                // RaisedButton(
                //   child: const Text('Share'),
                //   onPressed: () {
                //     String text = 'www.google.com';
                //     final RenderBox box = context.findRenderObject();
                //     Share.share(text, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                //   },
                // ),
            ],
          ),
        ),
      ),
    );
  }
}
