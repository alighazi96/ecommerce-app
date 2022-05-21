import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
   final Function(String? val) onSave;

  final String? Function(String? val) validator;
  //we use this beacuse it may take null value of nonnull value
  //and return null value or nonnull value



   const CustomTextFormField(
      {Key? key,
      required this.text,
      required this.hint,
      required this.onSave,
      required this.validator,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            alignment: Alignment.topLeft,

            text: text,
            fontSize: 16,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSave,  //An optional method to call with the final value when the form is saved
            validator: validator,//takes a function that returns null if the content of the field is valid, or a string if the content is invalid

            decoration:  InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white,
            filled: true),
          ),
        ],
      ),
    );
  }
}
