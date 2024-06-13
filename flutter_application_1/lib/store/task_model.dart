import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier{  // state manager
  List<Map<String, String>> _tasks =[];

  int getLength(){
    return _tasks.length;
  }

  void addList(List<Map<String, String>> list){
    _tasks=list;
  }

  Map<String, String> getTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      return _tasks[index];
    } else {
      // ignore: deprecated_member_use
      throw IndexError(index, _tasks);
    }
  }

  void addTask(data){
    _tasks.add(data);

    notifyListeners();   // notify listening widgets with updated values
  }
}