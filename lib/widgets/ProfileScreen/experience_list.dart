import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profilescreen/Controllers/controller_profile.dart';
import 'package:profilescreen/utils/app_constants.dart';
import 'package:profilescreen/utils/colors.dart';
import 'package:profilescreen/widgets/ProfileScreen/empty_sliver_widget.dart';

class ExperinceList extends StatelessWidget {
  ExperinceList({Key? key}) : super(key: key);
  final ControllerProfile cProfile = Get.put(ControllerProfile());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => cProfile.viewProfessional.value
          ? SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              cProfile.setExprince(
                                  cProfile.listExperince[index]["selected"]
                                              .toString() ==
                                          "true"
                                      ? false
                                      : true,
                                  index);
                            },
                            child: (cProfile.listExperince[index]["selected"]
                                        .toString() ==
                                    "true")
                                ? const Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.check_box_outline_blank,
                                    color: colorBodyText,
                                    size: 20,
                                  ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "I have " +
                                  cProfile.listExperince[index]["title"]
                                      .toString(),
                              style: TextStyle(color: colorBodyText),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  childCount: cProfile.listExperince.length,
                ),
              ),
            )
          : const EmptySliverWidget(),
    );
  }
}
