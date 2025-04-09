import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

class TextStyles {
  ///
  ///
  /// AUTH related Text Styles

  ///
  /// Size 32, color White, Semibold, Weight 700
  static size32cWhiteSemibold600(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        color: Colors.white,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  ///
  /// Size 14, color Dove 400, Regular, Weight 400
  static size14cDove400Regular400(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Gilroy',
        color: AppPallete.doveGrey400Color,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  ///
  /// Size 28, color White, Bold, Weight 700
  static size28cWhiteBold700(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28.0,
        color: Colors.white,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  /// CUSTOM STYLES
  ///
  /// Size 14, color Dove 300, Regular, Weight 400 - CUSTOM
  static size14cWhiteRegular400(String text, {Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 14.0,
        color: AppPallete.whiteColor,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  ///
  /// Size 12, color Default White, Regular, Weight 400 - CUSTOM
  static size12colorRegular400(String text, {Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 12.0,
        color: color ?? AppPallete.whiteColor,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  ///
  /// Size 10, color Dove 300, Regular, Weight 400
  static size10cDove300Regular400(String text) {
    return Text(
      text, // Button text
      style: TextStyle(
        fontSize: 10.0,
        color: AppPallete.doveGrey300Color,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  ///
  /// Size 12, color Dove 300, Regular, Weight 400
  static size12cDove500Regular400(String text) {
    return Text(
      text, // Button text
      style: TextStyle(
        fontSize: 12.0,
        color: AppPallete.doveGrey300Color,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  ///
  ///
  /// Customizable Font Styles

  ///
  /// DEFAULT - Size 10.0, Color white, Font Regular, Weight 600
  static customRegular400Text(String text, {double? textSize, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize ?? 10.0,
        color: color ?? AppPallete.whiteColor,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  ///
  /// DEFAULT - Size 14, Color white, Font Mediumn, Weight 500
  static customMedium500Text(String text, {double? textSize, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize ?? 10.0,
        color: color ?? AppPallete.whiteColor,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  ///
  /// DEFAULT - Size 14, Color white, Font SemiBold, Weight 600
  static customSemibold600Text(String text, {double? textSize, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize ?? 14.0,
        color: color ?? AppPallete.whiteColor,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  ///////////////////////
  ///////////////////////

  ///
  ///
  /// Text Styles ONLY

  ///
  /// Size 10, color Dove 300, Regular, Weight 400
  static customSizeColorTextStyle({
    double? fontSize,
    Color? color,
    FontWeight? weight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 10.0,
      color: color ?? AppPallete.whiteColor,
      fontFamily: 'Gilroy',
      fontWeight: weight ?? FontWeight.w400,
    );
  }

  ///
  /// Size 10, color Dove 300, Regular, Weight 400
  // static customSizeColorTextStyle({double? fontSize, Color? color}) {
  //   return TextStyle(
  //     fontSize: fontSize ?? 10.0,
  //     color: color ?? AppPallete.whiteColor,
  //     fontFamily: 'Gilroy',
  //     fontWeight: FontWeight.w400,
  //   );
  // }
}
