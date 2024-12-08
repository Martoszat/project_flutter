import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql =
      'CREATE TABLE $_tablename($_name TEXT, $_difficulty INTEGER, $_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async{}
  Future <List<Task>>findAll()async{
    print('FindAll');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    print('procurando: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> listaTarefas){
    print('convertendo list');
    final List<Task> tarefas = [];

    for(Map<String, dynamic> linha in listaTarefas){
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }

    return tarefas;
  }
  Future <List<Task>> findName(String nomeDaTarefa)async{
    final Database db = await getDatabase();
     final List<Map<String, dynamic>> result = await db.query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
     return toList(result);
  }
  delete(String nomeDaTarefa) async{}
}
