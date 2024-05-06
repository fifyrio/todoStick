import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/scheduler.dart';
import 'package:todostick/components/card.dart';
import '../components/add_todo.dart';
import '../components/dialog_box.dart';
import '../components/placeholder_view.dart';
import '../components/todo_item.dart';
import '../data/database.dart';
import '../util/timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();
  final _textController = TextEditingController();
  bool _isTextFieldVisible = false;

  ToDoDataBase db = ToDoDataBase();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      if (index >= 0 && index < db.toDoList.length) {
        db.toDoList[index][1] = !db.toDoList[index][1];
      }
    });
    db.updateDataBase(dates[selectIndex]);
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(controller: _textController,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSave: saveNewTask);
      },
    );
  }

  void saveNewTask() {
    if (_textController.text.isEmpty) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      db.toDoList.add([_textController.text, false]);
      _isTextFieldVisible = false;
      _textController.clear();
      db.updateDataBase(dates[selectIndex]);
    });

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    dates = TimeUtils.getDateRange();
    selectIndex = TimeUtils.getCurrentDateIndex(dates);
    db.loadData(dates[selectIndex]);

    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollToIndex(selectIndex); // Change this to the index you want.
    });
  }

  void scrollToIndex(int index) {
    _controller.animateTo(
      index * 80.0,  // 70.0 is the height of each ListTile in this case
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  List<String> dates = [];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Tasks', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TimeUtils.formatTitleDate(dates[selectIndex])[0],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                Text(
                    TimeUtils.formatTitleDate(dates[selectIndex])[1],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 164,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // 设置滚动方向为水平方向
                itemCount: dates.length,
                controller: _controller,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                        scrollToIndex(selectIndex);
                        db.loadData(dates[selectIndex]);
                      });
                    },
                    child: SizedBox(
                      width: 80.0, // 可以设置container的宽度
                      child: Card(
                        child: DayCard(viewModel: DayCardViewModel.transform(dates[index]), isSelected: selectIndex == index,),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.green, // 设置绿色
                  onPressed: () {
                    setState(() {
                      _isTextFieldVisible = true;
                    });
                  },
                )
              ],
            ),
            if (_isTextFieldVisible)
              AddToDoBox(
                  controller: _textController,
                  onPressedAdd: () {
                    setState(() {
                      db.toDoList.add([_textController.text, false]);
                      _isTextFieldVisible = false;
                      _textController.clear();
                      db.updateDataBase(dates[selectIndex]);
                    });
                  },
                  onPressedCancel: () {
                    setState(() {
                      _isTextFieldVisible = false;
                      _textController.clear();
                    });
                  }),
            Expanded(
              child: db.toDoList.isNotEmpty ? ListView.builder(
                  itemCount: db.toDoList.length,
                  itemBuilder: (context, index) {
                    return TodoItem(taskName: db.toDoList[index][0], taskCompleted: db.toDoList[index][1], onChanged: (selected){
                      checkBoxChanged(selected, index);
                    },);
                  }
              ) : PlaceholderView(onPressedAdd: () {
                createNewTask();
              },),
            )
          ],
        ),
      ),
    );
  }
}
