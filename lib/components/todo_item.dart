import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TodoItem({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.white60,
            side: const BorderSide(color: Colors.white, width: 2),
          ),
          Text(
            taskName,
            style: TextStyle(
              fontSize: 20,
              color: taskCompleted ? Colors.white60 : Colors.white ,
              decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
