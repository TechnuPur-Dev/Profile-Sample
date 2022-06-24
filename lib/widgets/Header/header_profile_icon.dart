import 'package:flutter/material.dart';

class HeaderProfileIcon extends StatelessWidget {
  const HeaderProfileIcon({Key? key, this.onTap}) : super(key: key);
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function(),
      child: Container(
        // radius: 20,
        // backgroundColor: Colors.transparent,
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          image: const DecorationImage(
            image: AssetImage('assets/images/profile.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
