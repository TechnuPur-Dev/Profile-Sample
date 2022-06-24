import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get/get.dart';
import 'package:profilescreen/Controllers/controller_header.dart';

class HeaderShareIcon extends StatelessWidget {
  HeaderShareIcon({Key? key}) : super(key: key);
  final ControllerHeader cHeader = Get.put(ControllerHeader());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PortalTarget(
        visible: cHeader.flagMenu.value,
        anchor: const Aligned(
          follower: Alignment.topCenter,
          target: Alignment.bottomCenter,
        ),
        portalFollower: Material(
          color: Colors.transparent,
          elevation: 0,
          child: IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/icon_fb.png")),
                InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/icon_twitter.png")),
                InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/icon_instagram.png")),
                InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/icon_youtube.png")),
                InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/icon_whatsapp.png")),
              ],
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            cHeader.setMenu(!cHeader.flagMenu.value);
          },
          child: Container(
            // radius: 20,
            // backgroundColor: Colors.transparent,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),

            child: const Center(
              child: Icon(
                Icons.share,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
