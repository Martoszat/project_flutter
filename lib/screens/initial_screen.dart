// import 'package:flutter/material.dart';
// // import 'package:primeiro_projeto/components/task.dart';
// import 'package:primeiro_projeto/data/task_inherited.dart';
// import 'package:primeiro_projeto/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';
import 'package:provider/provider.dart';

// class InitialScreen extends StatefulWidget {
//   const InitialScreen({Key? key}) : super(key: key);

//   @override
//   State<InitialScreen> createState() => _InitialScreenState();
// }

// class _InitialScreenState extends State<InitialScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(),
//         title: const Text('Tarefas'),
//       ),
//       body: ListView(
//         children: TaskInherited.of(context).taskList,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (contextNew) => FormScreen(taskContext: context,),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: Consumer<TaskInherited>(
        builder: (context, taskInherited, child) {
          return ListView.builder(
            itemCount: taskInherited.taskList.length,
            itemBuilder: (context, index){
            return taskInherited.taskList[index];
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
