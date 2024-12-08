import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';

class TaskInherited extends ChangeNotifier {
  List<Task> taskList = [];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
    notifyListeners(); // Notifica que houve uma mudança
  }
}

// class TaskInherited extends InheritedWidget {
//   TaskInherited({
//     Key? key,
//     required Widget child,
//   }) : super(key: key, child: child);

//   List<Task> taskList = [];

//   void newTask(String name, String photo,int difficulty){
//     taskList.add(Task(name, photo, difficulty));
//   }

//  @override
//   bool updateShouldNotify(TaskInherited oldWidget) {
//     return oldWidget.taskList.length != taskList.length;
//   }

//   static TaskInherited of(BuildContext context) {
//     final TaskInherited? result =
//         context.dependOnInheritedWidgetOfExactType<TaskInherited>();
//     assert(result != null, 'No TaskInherited found in context');
//     return result!;
//   }
// }