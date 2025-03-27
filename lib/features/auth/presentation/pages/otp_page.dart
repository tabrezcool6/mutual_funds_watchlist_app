import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/loader.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/primary_button.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';
import 'package:mutual_funds_watchlist/core/utils.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/bloc/otp_timer_cubit/otp_timer_cubit.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_agree_terms_widget.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_base_class.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_home_indicator.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_otp_field.dart';
import 'package:mutual_funds_watchlist/features/dashboard/dashboard.dart';

class OtpPage extends StatefulWidget {
  static route({required String number}) =>
      MaterialPageRoute(builder: (context) => OtpPage(phone: number));

  const OtpPage({required this.phone, super.key});

  final String phone;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final FocusNode _otpFocusNode = FocusNode();
  final _otpController = TextEditingController();
  bool _isEnabled = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _otpFocusNode.requestFocus();
    BlocProvider.of<OtpTimerCubit>(context).startCountdown();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _resendOtpOnTap() {
    BlocProvider.of<OtpTimerCubit>(context).startCountdown();
    context.read<AuthBloc>().add(AuthSignInEvent(phone: widget.phone));
  }

  void verifyOtpOnTap() {
    if (_formKey.currentState!.validate() && _isEnabled) {
      context.read<AuthBloc>().add(
        AuthVerifyOtpEvent(phone: widget.phone, otp: _otpController.text),
      );
    }
  }

  /// otp validator
  void _validateOtpField(value) {
    if (value.length == 6) {
      _isEnabled = true;
      verifyOtpOnTap();
    } else {
      _isEnabled = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Utils.showSnackBar(context, state.message);
        } else if (state is AuthSuccess) {
          Utils.showSnackBar(context, "OTP has sent successfully");
        } else if (state is AuthOtpSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            Dashboard.route(),
            (context) => false,
          );
        }
      },

      builder: (context, state) {
        return AuthBaseClassWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ).copyWith(top: 90.0),

            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthGreetingsWidget(),

                  SizedBox(height: 82.0),

                  TextStyles.size14cWhiteRegular400("Enter OTP"),

                  SizedBox(height: 35.62),

                  /// OTP input field
                  AuthInputOtpField(
                    controller: _otpController,
                    focusNode: _otpFocusNode,
                    onChanged: (value) => _validateOtpField(value),
                  ),

                  /// show error if otp is invalid
                  if (_otpController.text.isNotEmpty &&
                      state is AuthOtpFailure) ...[
                    Padding(
                      padding: EdgeInsets.only(top: 34.0),
                      child: TextStyles.size12colorRegular400(
                        "Invalid OTP! Please try again",
                        color: AppPallete.errorColor,
                      ),
                    ),
                  ],

                  _otpTimerBuilder(),

                  // SizedBox(height: 16.0),
                  SizedBox(height: 16.0),

                  Row(
                    children: [
                      TextStyles.size12colorRegular400(
                        "OTP has been sent on 964*****405",
                        color: AppPallete.doveGreyColor,
                      ),

                      SizedBox(width: 8.0),

                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.edit,
                          color: AppPallete.doveGrey500Color,
                          size: 12,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 56.0),

                  if (state is AuthLoading) ...[
                    Loader(),
                  ] else ...[
                    /// Sign In Primary Button
                    PrimaryButton(
                      widget: TextStyles.size14cWhiteRegular400('Proceed'),
                      width: double.infinity,
                      addPadding: true,
                      onPressed: verifyOtpOnTap,
                      isEnabled: _isEnabled,
                    ),
                  ],

                  Spacer(),

                  AuthAgreeTermsWidget(),

                  AuthHomeIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ///
  /// otp timer widget
  BlocBuilder<OtpTimerCubit, int> _otpTimerBuilder() {
    return BlocBuilder<OtpTimerCubit, int>(
      builder: (context, state) {
        if (state > 0) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                TextStyles.size12colorRegular400("${state}sec"),
                SizedBox(width: 8.0),

                TextStyles.size12colorRegular400(
                  "Resend",
                  color: AppPallete.doveGrey500Color,
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              TextStyles.size12colorRegular400("Didn't Receive OTP?"),
              SizedBox(width: 8.0),

              GestureDetector(
                child: TextStyles.size12colorRegular400(
                  "Resend",
                  color: AppPallete.primaryColor,
                ),
                onTap: _resendOtpOnTap,
              ),
            ],
          ),
        );
      },
    );
  }
}
