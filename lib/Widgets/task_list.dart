import 'package:flutter/material.dart';
import 'package:todoey/Widgets/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:cool_alert/cool_alert.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList(this.tasks);
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,index)
    {
      return TaskTile(
        tasktitle: widget.tasks[index].name,
        ischecked: widget.tasks[index].isdone,
        checkboxcallback: ( bool newvalue)
        {
          setState(() {
            widget.tasks[index].toggle();
            if(widget.tasks[index].isdone==true)
              {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.confirm,
                  text: 'Do you want to delete this task?',
                  confirmBtnText: "Yes",
                  cancelBtnText: "No",
                  confirmBtnColor: Colors.lightBlueAccent,
                  onConfirmBtnTap: ()
                    {
                      setState(() {
                        widget.tasks.removeAt(index);
                      });
                      Navigator.pop(context);
                        },
                    onCancelBtnTap: (){
                    Navigator.pop(context);
                    setState(() {
                      widget.tasks[index].toggle();
                    });
                }
                );
              }
          });
        },
      );

    },
    itemCount: widget.tasks.length,);
  }
}