import 'package:flutter/material.dart';
class AddTaskScreen extends StatelessWidget {
  final Function addtaskcallback;
  AddTaskScreen(this.addtaskcallback);
  @override
  Widget build(BuildContext context) {
    String newtask;
    return Container(
      padding: EdgeInsets.all(10),
      color: Color(0xFF757575),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value)
                {
                  newtask = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                color: Colors.lightBlueAccent,
                onPressed: (){
                  addtaskcallback(newtask);
                },
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        ),
      ),
    );
  }
}
