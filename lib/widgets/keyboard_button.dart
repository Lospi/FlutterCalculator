import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final Widget buttonWidget;

  const KeyboardButton({
    Key? key,
    required this.buttonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 20, 20, 20),
      ),
      child: Center(
        child: buttonWidget,
      ),
    );
  }
}
