import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String taskTitle;
  final Color colour;

  TaskTile({
    this.taskTitle,
    this.colour,
  });

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.colour,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: ListTile(
          title: Text(
            widget.taskTitle,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Montserrat',
            ),
          ),
          trailing: Checkbox(
            activeColor: widget.colour == Colors.blueAccent
                ? Colors.lightBlueAccent
                : Colors.blueAccent,
            value: isChecked,
            onChanged: (val) {
              setState(() {
                if (isChecked)
                  isChecked = false;
                else
                  isChecked = true;
              });
            },
          ),
        ),
      ),
    );
  }
}
