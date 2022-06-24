import 'package:flutter/material.dart';
import 'package:profilescreen/utils/colors.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: colorBlack,
          size: 15,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: colorWhite, fontSize: 12),
        ),
      ],
    );
  }
}
