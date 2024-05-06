import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF221e2c),
      content: SizedBox(
        height: 160,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("First Task", style: TextStyle(color: Colors.white, fontFamily: "ShadowsIntoLight", fontSize: 28)),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter your task',
                  hintStyle: TextStyle(
                    color: Colors.white30,
                  ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               TextButton(
                 child: const Text("Cancel", style: TextStyle(color: Colors.deepPurple, fontSize: 16),),
                 onPressed: () {
                   onCancel();
                 },
               ),
               TextButton(
                 child: const Text("OK", style: TextStyle(color: Colors.deepPurple, fontSize: 16)),
                 onPressed: () {
                   onSave();
                 },
               ),
             ],
           )
          ],
        ),
      ),
    );
  }
}
