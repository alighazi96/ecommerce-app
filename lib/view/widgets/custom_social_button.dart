import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback onPress;

  const CustomSocialButton(
      {Key? key,
      required this.text,
      required this.imageName,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade50,
      ),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          )),
          onPressed: onPress,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(imageName, scale: 3),
              const SizedBox(
                width: 80,
              ),
              CustomText(
                text: text,
              )
            ],
          )),
    );
  }
}
