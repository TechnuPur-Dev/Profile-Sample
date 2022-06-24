import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class Heading extends StatelessWidget {
  const Heading({Key? key, required this.title}) : super(key: key);
  final String title;

  get colorBorderColor => null;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              color: colorBorderColor,
              height: 10,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
