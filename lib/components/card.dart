import 'package:flutter/material.dart';

import '../util/timer.dart';

class DayCardViewModel {
  final String month;
  final String day;
  final String week;
  const DayCardViewModel({
    required this.month,
    required this.day,
    required this.week,
  });
  static DayCardViewModel transform(String dateString) {
    var data = TimeUtils.formatDate(dateString);
    return DayCardViewModel(month: data[0], day: data[1], week: data[2]);
  }
}

class DayCard extends StatelessWidget {

  final DayCardViewModel viewModel;
  final bool isSelected;

  const DayCard({
    super.key,
    required this.viewModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple:Colors.black, // 设置背景颜色
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ?Colors.purple:Colors.grey, // 设置边框颜色
            width: 1, // 设置边框宽度
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(viewModel.month, style: TextStyle(color: isSelected ?Colors.white:Colors.white70),),
            Text(viewModel.day, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
            Text(viewModel.week, style: TextStyle(color: isSelected ?Colors.white:Colors.white70),),
          ],
        )
      );
  }
}
