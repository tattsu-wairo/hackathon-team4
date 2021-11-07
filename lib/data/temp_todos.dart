import 'package:flutter/material.dart';

import '../model/todo_model.dart';
import 'package:provider/provider.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todoList = [];

  List<Todo> get todoList {
    return [..._todoList];
  }

  void addTodo(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todoList.remove(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    _todoList.remove(todo);
    _todoList.add(todo);
    notifyListeners();
  }
}


// List<Todo> tempTodos = [
//   // Todo(
//   //   dateFrom: DateTime.now().subtract(Duration(days: 3)),
//   //   dateTo: DateTime.now(),
//   //   todoText: '数学ワークp40-42',
//   // )
// ];
