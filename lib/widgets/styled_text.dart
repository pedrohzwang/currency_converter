import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class StyledText extends StatelessWidget {
  StyledText(this.text, {super.key});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
