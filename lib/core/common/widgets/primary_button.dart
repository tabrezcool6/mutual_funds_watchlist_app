import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

///TODO:-
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.text,
    this.height,
    this.widget,
    this.width,
    this.color,
    this.addPadding = false,
    this.isRounded = false,
    this.isEnabled = false,
    this.onPressed,
    super.key,
  });
  final String? text;
  final Widget? widget;
  final double? height;
  final double? width;
  final bool addPadding;
  final bool isEnabled;
  final bool isRounded;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var childPadding = EdgeInsets.all(
      0,
    ).copyWith(right: 20, left: 20.0, top: 6.5, bottom: 6.5);

    ///
    var roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(isRounded ? 50.0 : 10.0),
      side: BorderSide(color: AppPallete.doveGrey600Color, width: 0.75),
    );

    ///
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: addPadding ? 59.0 : 0.0),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: childPadding,
            backgroundColor:
                isEnabled
                    ? AppPallete.primaryColor
                    : color ?? AppPallete.bgColor,

            shape: roundedRectangleBorder,
          ),
          child:
              text != null
                  ? Text(
                    text!, // Button text
                    style: TextStyle(
                      fontSize: 10.0,
                      color: AppPallete.whiteColor,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  : widget,
        ),
      ),
    );
  }
}