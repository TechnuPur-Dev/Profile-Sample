import 'package:flutter/material.dart';
import 'package:profilescreen/utils/app_constants.dart';
import 'package:profilescreen/utils/colors.dart';

class ShowHideView extends StatelessWidget {
  const ShowHideView(
      {Key? key, required this.title, required this.onTap, this.flag = false})
      : super(key: key);
  final String title;
  final Function onTap;
  final bool flag;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppContanst.PADDING),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: colorLightBackGround),
          child: InkWell(
            onTap: onTap as void Function(),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: flag
                      ? Image.asset("assets/images/checkBoxChecked.png")
                      : Image.asset("assets/images/checkBoxUnChecked.png"),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
