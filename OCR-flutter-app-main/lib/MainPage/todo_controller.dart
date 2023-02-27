import 'package:flutter/material.dart';

class TodoController extends ChangeNotifier {
  List _todoItems = [];

  List get todoItems => _todoItems;

  void addTodo({
    required String title,
    required String description,
  }) {
    _todoItems.add({
      "title": title,
      "description": description,
    });
    notifyListeners();
  }
}
