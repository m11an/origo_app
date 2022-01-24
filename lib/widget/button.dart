import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onPress;
  final Color? buttonColor;
  final Color? textColor;
  const ButtonWidget({
    required this.title,
    required this.onPress,
    this.buttonColor,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c = Colors.blue;
    Color t = Colors.white;
    if (buttonColor != null) {
      c = buttonColor!;
    }
    if (textColor != null) {
      t = textColor!;
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(c),
          elevation: MaterialStateProperty.all(4.0),
        ),
        onPressed: () => onPress(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              color: t,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
