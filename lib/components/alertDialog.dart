import 'package:flutter/material.dart';

AlertDialog alertDialog(BuildContext context) {
  return AlertDialog(
    title: Text('Are you sure?'),
    content: Text(
      'You are going to exit the application.',
    ),
    actions: <Widget>[
      FlatButton(
        child: Text('NO'),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ),
      FlatButton(
        child: Text('YES'),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ),
    ],
  );
}

AlertDialog alertDialogEroor(BuildContext context, String message) {
  return AlertDialog(
    title: Text('Oops !!'),
    content: Text(
      message,
    ),
    actions: <Widget>[
      FlatButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ),
    ],
  );
}

