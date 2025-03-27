import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthInputOtpField extends StatelessWidget {
  const AuthInputOtpField({
    required this.focusNode,
    required this.controller,
    required this.onChanged,
    super.key,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      focusNode: focusNode,
      appContext: context,
      length: 6,
      onChanged: onChanged,
      // (value) {
      //   setState(() {
      //     currentText = value;
      //   });
      // },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 26.24,
        inactiveColor: AppPallete.doveGrey600Color,
        inactiveFillColor: AppPallete.doveGrey600Color,
        activeColor: AppPallete.primaryColor,
        activeFillColor: AppPallete.whiteColor,
        selectedFillColor: AppPallete.whiteColor,
        errorBorderColor: AppPallete.errorColor,
      ),
      cursorColor: AppPallete.doveGrey600Color,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(
        fontSize: 24.43,
        color: AppPallete.whiteColor,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

// class OTPInput extends StatefulWidget {
//   const OTPInput({super.key});

//   @override
//   _OTPInputState createState() => _OTPInputState();
// }

// class _OTPInputState extends State<OTPInput> {
//   final List<TextEditingController> _controllers = List.generate(
//     6,
//     (_) => TextEditingController(),
//   );
//   final List<String> _otp = List.filled(6, '');

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: List.generate(6, (index) {
//         return Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: _buildOTPField(index),
//           ),
//         );
//       }),
//     );
//   }

//   Widget _buildOTPField(int index) {
//     return Container(
//       // height: 64.0,
//       child: TextField(
//         controller: _controllers[index],

//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         style: TextStyle(color: AppPallete.primaryColor),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(0),
//           counterText: '',
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.blue,
//               width: 3,
//             ), // Underline color when enabled
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.blue,
//             ), // Underline color when focused
//           ),
//           errorBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.red,
//             ), // Underline color when error
//           ),
//           focusedErrorBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.redAccent,
//             ), // Focused error underline color
//           ),
//           // filled: true,
//           // fillColor: Colors.grey[300],
//         ),

//         // onChanged: (value) {
//         //   if (value.length == 1) {
//         //     _otp[index] = value; // Store OTP value
//         //     if (index < 5) {
//         //       FocusScope.of(context).nextFocus(); // Move to next field
//         //     }
//         //   } else if (value.isEmpty) {
//         //     _otp[index] = ''; // Clear value on delete
//         //     if (index > 0) {
//         //       FocusScope.of(context).previousFocus(); // Move to previous field
//         //     }
//         //   }
//         // },
//         onChanged: (value) {
//           if (value.length == 1) {
//             // Move to the next field when a digit is entered
//             if (index < 5) {
//               FocusScope.of(context).nextFocus();
//             }
//           } else if (value.isEmpty) {
//             // Move to the previous field when the current field is cleared
//             if (index > 0) {
//               FocusScope.of(context).previousFocus();
//             }
//           }
//         },
//       ),
//     );
//   }
// }
