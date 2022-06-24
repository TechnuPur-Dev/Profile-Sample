import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profilescreen/Controllers/controller_profile.dart';
import 'package:profilescreen/utils/app_constants.dart';
import 'package:profilescreen/utils/colors.dart';
import 'package:profilescreen/widgets/ProfileScreen/dropdpwn_skills.dart';
import 'package:profilescreen/widgets/ProfileScreen/empty_sliver_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AgeSlider extends StatelessWidget {
  AgeSlider({Key? key}) : super(key: key);
  final ControllerProfile cProfile = Get.put(ControllerProfile());

  @override
  Widget build(BuildContext context) {
    return Obx(() => (cProfile.viewProfessional.value)
        ? SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
              child: Column(children: [
                const DropDownSkills(),
                const SizedBox(height: 20),
                const Text(
                  "How long have you been in this industry?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: SfSlider(
                          min: 0.0,
                          max: 20.0,
                          value: cProfile.yearsExprence.toDouble(),
                          interval: 1,
                          stepSize: 0.5,
                          showTicks: false,
                          showLabels: false,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          activeColor: colorDarkBlue,
                          onChanged: (dynamic value) {
                            cProfile.setYearofEx(value);
                          },
                        ),
                      ),
                      SizedBox(
                          width: 70,
                          child: Text(
                              cProfile.yearsExprence.toString() + " years")),
                    ],
                  ),
                ),
              ]),
            ),
          )
        : const EmptySliverWidget());
  }
}
