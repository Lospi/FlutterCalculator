import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final Widget buttonWidget;

  const KeyboardButton({
    Key? key,
    required this.buttonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 20, 20, 20),
          ),
          child: Center(
            child: buttonWidget,
          ),
        ),
      ),
      Positioned.fill(
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                splashColor: Colors.black45,
                highlightColor: Colors.white10,
                onTap: () {},
              ))),
    ]);
  }
}
