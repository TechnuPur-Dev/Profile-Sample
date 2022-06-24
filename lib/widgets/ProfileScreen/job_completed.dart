import 'package:flutter/material.dart';
import 'package:profilescreen/utils/colors.dart';

import '../../utils/global_functions.dart';

class JobCompleted extends StatelessWidget {
  const JobCompleted({Key? key, required this.title, required this.count})
      : super(key: key);
  final String title;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colorBorderColor,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formateAmount(count),
              style: TextStyle(
                  fontSize: 20, color: colorPink, fontWeight: FontWeight.w600),
            ),
            Text(
              title,
              style: TextStyle(color: colorBodyText),
            )
          ],
        ));
  }
}
