import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class SliverPaddingHeight extends StatelessWidget {
  const SliverPaddingHeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(padding: EdgeInsets.only(top: AppContanst.HEIGT));
  }
}
