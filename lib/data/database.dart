import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('myBox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
    ];
  }

  // load the data from database
  void loadData(String date) {
    toDoList = _myBox.get(date) ?? [];
  }

  // update the database
  void updateDataBase(String date) {
    print(date);
    _myBox.put(date, toDoList);
  }
}
