import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

class ChartDurationButton extends StatelessWidget {
  const ChartDurationButton({
    required this.text,
    this.isSelected = false,
    super.key,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 26,

        child: ElevatedButton(
          onPressed: () {
            // Action to be performed on button press
            print('Button Pressed!');
            // Navigator.push(context, OtpPage.route());
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.all(
              0,
            ).copyWith(right: 20, left: 20.0, top: 6.5, bottom: 6.5),
            backgroundColor:
                isSelected ? AppPallete.primaryColor : AppPallete.bgColor,

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
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.0,
              color: AppPallete.whiteColor,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
