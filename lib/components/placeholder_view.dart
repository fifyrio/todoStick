import 'dart:ui';

import 'package:flutter/material.dart';

class PlaceholderView extends StatelessWidget {
  VoidCallback onPressedAdd;

  PlaceholderView({
    super.key,
    required this.onPressedAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 36, left: 12, right: 12),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.stars_rounded,
            color: Colors.purple,
            size: 108.0,
          ),
          const SizedBox(height: 44),
          const Text("Thank you for downloading our app. Add your first task!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white)),
          const SizedBox(height: 24),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  onPressedAdd();
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(left: 32, right: 32)),
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: const Text('Add First Task', style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}

