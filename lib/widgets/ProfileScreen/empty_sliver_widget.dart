import 'package:flutter/material.dart';

class EmptySliverWidget extends StatelessWidget {
  const EmptySliverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(top: 0),
    );
  }
}
