// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    this.focusNode,
    required this.controller,
    this.onChanged,
    super.key,
  });

  final FocusNode? focusNode;
  final TextEditingController controller;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLength: 10,
        style: TextStyle(
          fontSize: 14.0,
          color: AppPallete.whiteColor,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
        ),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        cursorColor: AppPallete.doveGrey800Color,
        decoration: InputDecoration(
          filled: true,
          counterText: '',
          fillColor: AppPallete.signinTextFieldFilled,
          prefixText: '+91 ',
          prefixStyle: TextStyle(
            fontSize: 14.0,
            color: AppPallete.whiteColor,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
          ), // Prefix text color
          hintText: '9600668741', // Placeholder text
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: AppPallete.whiteColor.withOpacity(0.5),
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.all(0).copyWith(left: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppPallete.signinTextFieldBorder,
              width: 0.75,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppPallete.signinTextFieldBorder,
              width: 0.75,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppPallete.signinTextFieldBorder,
              width: 0.75,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppPallete.signinTextFieldBorder,
              width: 0.75,
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
