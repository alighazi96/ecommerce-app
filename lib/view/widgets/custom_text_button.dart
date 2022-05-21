import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        )),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: onPressed,
      child: CustomText(
        color: Colors.black,
        text: text,
        fontSize: 16,
      ),
    );
  }
}
