import 'package:flutter/material.dart';

class AddToDoBox extends StatelessWidget {

  final controller;
  VoidCallback onPressedAdd;
  VoidCallback onPressedCancel;

  AddToDoBox({
    super.key,
    required this.controller,
    required this.onPressedAdd,
    required this.onPressedCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Padding(padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter your task',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
            ),

            IconButton(
              icon: const Icon(Icons.add_circle),
              color: Colors.white, // 设置绿色
              onPressed: () {
                onPressedAdd();
              },
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded),
              color: Colors.white, // 设置绿色
              onPressed: () {
                onPressedCancel();
              },
            ),
          ],
        ),
      )
    );
  }
}

