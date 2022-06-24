import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  const Header({Key? key, required this.title, this.actions = const []})
      : super(key: key);
  final String title;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/headerBackground.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: actions,
            )
          ],
        ),
      )),
    );
  }
}
