import 'package:easy_v3/utils/color_app.dart';
import 'package:flutter/material.dart';


class WishlistButton extends StatefulWidget {
  const WishlistButton({super.key});

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
      },
      child: Container(
        height: 40,
        width: 40,

        child: Icon(
          isOn ? Icons.bookmark_add : Icons.bookmark_add_outlined,
          size: 30,
          color: isOn ? accentColor : secondaryColor,
        ),
      ),
    );
  }
}