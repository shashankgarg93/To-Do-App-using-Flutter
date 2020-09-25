import 'package:flutter/material.dart';
import 'package:todoey/Widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:todoey/models/task.dart';

class TaskScreen extends StatefulWidget {

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name:'task1',isdone: false),
    Task(name:'task2',isdone: false)
  ];
  @override
  Widget build(BuildContext context) {
    String total = (tasks.length).toString();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:() {showModalBottomSheet(context: context, builder: (context)=>
        AddTaskScreen((newtask)
        {
          setState(() {
            tasks.add(Task(name: newtask,isdone: false));
          });
          Navigator.pop(context);
        }));},
        elevation: 15,
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50,left: 30,right: 30,bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.list,
                  size: 30,
                  color: Colors.lightBlueAccent,),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('To-Doey',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),),
                SizedBox(
                  height: 5,
                ),
                Text('  $total tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TaskList(tasks),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

