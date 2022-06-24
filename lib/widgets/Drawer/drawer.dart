import 'package:flutter/material.dart';

import 'package:profilescreen/utils/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  // CustomDrawer(this._scaffoldKey);
  // final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  widgetItems(String name, String asset, Function onTap) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Image.asset(
            asset,
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(fontSize: 16, color: colorBodyText),
          ),
        ],
      ),
    );
  }

  widgetItemsBottom(String name, String asset, Function onTap) {
    return Row(
      children: [
        Image.asset(
          asset,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 1),
        Text(
          name,
          style: TextStyle(fontSize: 14, color: colorBodyText),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: colorWhite,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Divider(
                    color: colorBorderColor,
                    height: 5,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset('assets/images/profile.png'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Brendan Moore",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("Tagline will go here",
                                  style: TextStyle(
                                      fontSize: 14, color: colorBodyText)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: colorBorderColor,
                    height: 40,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      widgetItems("Profile", "assets/images/icon_profile.png",
                          () {
                        // Get.offAll(ProfileScreen());
                      }),
                      widgetItems("My Stats", "assets/images/icon_mystat.png",
                          () {
                        // Get.offAll(ProfileScreen());
                      }),
                      widgetItems("Reports", "assets/images/icon_reports.png",
                          () {
                        // Get.offAll(ProfileScreen());
                      }),
                      widgetItems("Notifications",
                          "assets/images/icon_notifications.png", () {
                        // Get.offAll(ProfileScreen());
                      }),
                    ],
                  ),
                  Divider(
                    color: colorBorderColor,
                    height: 40,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Divider(
              color: colorBorderColor,
              height: 10,
              thickness: 1,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  widgetItemsBottom(
                      "Settings", "assets/images/icon_settings.png", () {
                    // Get.offAll(ProfileScreen());
                  }),
                  widgetItemsBottom(
                      "Help & Support", "assets/images/icon_help.png", () {
                    // Get.offAll(ProfileScreen());
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
