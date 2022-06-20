import 'package:flutter/material.dart';

Widget CustomCard(Widget content) {
  bool selected = false;
  return Container(
    // alignment: Alignment.center,
    child: content,
    decoration: BoxDecoration(
      color: const Color(0xff1d1f33),
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.all(16),
  );
}

Column Content(Widget top, middle, bottom) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        child: Column(
          children: [
            top,
            const SizedBox(
              height: 5,
            ),
            middle,
          ],
        ),
      ),
      bottom
    ],
  );
}

Widget buttons(
  void Function() calc,
  IconData btnIcon,
) {
  return GestureDetector(
    onTap: calc,
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xff0a0d22),
        borderRadius: BorderRadius.circular(40),
      ),
      height: 70,
      width: 70,
      child: Icon(
        btnIcon,
        size: 50,
      ),
    ),
  );
}
