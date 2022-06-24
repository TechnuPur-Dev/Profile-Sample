import 'package:flutter/material.dart';
import 'package:profilescreen/utils/app_constants.dart';
import 'package:profilescreen/utils/colors.dart';
import 'package:profilescreen/widgets/ProfileScreen/info_with_icon.dart';
import 'package:profilescreen/widgets/ProfileScreen/job_completed.dart';

class PhoneEmailState extends StatelessWidget {
  const PhoneEmailState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(AppContanst.PADDING),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppContanst.PADDING / 2,
                  vertical: AppContanst.PADDING - 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: colorPink),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    InfoIcon(
                        icon: Icons.phone_android, text: '+1 321 456 9870'),
                    InfoIcon(
                        icon: Icons.mark_email_read_outlined,
                        text: 'info@domainname.com')
                  ]),
            ),
            SizedBox(height: AppContanst.HEIGT),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: JobCompleted(
                    title: 'Job Completed',
                    count: 20583,
                  ),
                ),
                SizedBox(width: AppContanst.HEIGT),
                const Expanded(
                  child: JobCompleted(
                    title: 'Views',
                    count: 9112828,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
