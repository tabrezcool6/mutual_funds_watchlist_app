import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

class ChartDurationButton extends StatelessWidget {
  const ChartDurationButton({
    required this.text,
    this.onTap,
    this.isSelected = false,
    this.textSize,
    super.key,
  });

  final String text;
  final double? textSize;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 26,
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.all(0),
            //.copyWith(right: 20, left: 20.0, top: 6.5, bottom: 6.5),
            backgroundColor:
                isSelected
                    ? AppPallete.primaryColor
                    : AppPallete.transparentColor,

            shape:
                isSelected
                    ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(
                        color: AppPallete.doveGrey600Color,
                        width: 0.75,
                      ),
                    )
                    : null,

            surfaceTintColor: AppPallete.transparentColor,
            disabledBackgroundColor: AppPallete.transparentColor,
            disabledForegroundColor: AppPallete.transparentColor,
            overlayColor: AppPallete.transparentColor,
            shadowColor: AppPallete.transparentColor,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize ?? 12.0,
              color:
                  isSelected
                      ? AppPallete.whiteColor
                      : AppPallete.doveGrey500Color,
              // color: AppPallete.whiteColor,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
