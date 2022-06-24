import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/controller_profile.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';

class MySkills extends StatelessWidget {
  MySkills({Key? key}) : super(key: key);
  final ControllerProfile cProfile = Get.put(ControllerProfile());
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
      sliver: Obx(
        () => SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Row(
                  children: [
                    Image.asset("assets/images/checkbox.png"),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        cProfile.listItemsMySkills[index].toString(),
                        style: TextStyle(color: colorBodyText),
                      ),
                    )
                  ],
                );
              },
              childCount: cProfile.listItemsMySkills.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // mainAxisSpacing: 10,
              // crossAxisSpacing: 10,
              childAspectRatio: 6.0,
            )),
      ),
    );
  }
}
