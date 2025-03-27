import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/loader.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/primary_button.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';
import 'package:mutual_funds_watchlist/core/utils.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/pages/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_agree_terms_widget.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_base_class.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_home_indicator.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_text_field.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignInPage());
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FocusNode _phoneFocusNode = FocusNode();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  void _loginOnTap() {
    if (_formKey.currentState!.validate() && isEnabled) {
      context.read<AuthBloc>().add(
        AuthSignInEvent(phone: "+91${_phoneController.text}"),
      );
    }
  }

  void _phoneValidator(value) {
    if (value.length == 10) {
      isEnabled = true;
    } else {
      isEnabled = false;
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
          Navigator.push(
            context,
            OtpPage.route(number: "+91${_phoneController.text}"),
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

                  TextStyles.size14cWhiteRegular400("Enter your phone number"),

                  SizedBox(height: 12.0),

                  /// Input Text field to get User Phone Number
                  AuthTextField(
                    focusNode: _phoneFocusNode,
                    controller: _phoneController,
                    onChanged: (value) => _phoneValidator(value),
                  ),

                  /// show error if phone number is 10 digit and not empty
                  if (!isEnabled && _phoneController.text.isNotEmpty) ...[
                    Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: TextStyles.size12colorRegular400(
                        "Invalid Phone! Please try again",
                        color: AppPallete.errorColor,
                      ),
                    ),
                  ],

                  SizedBox(height: 56.0),
                  if (state is AuthLoading) ...[
                    Loader(),
                  ] else ...[
                    /// Sign In Primary Button
                    PrimaryButton(
                      widget: TextStyles.size14cWhiteRegular400('Proceed'),
                      width: double.infinity,
                      addPadding: true,
                      onPressed: _loginOnTap,
                      isEnabled: isEnabled,
                    ),
                  ],

                  Spacer(),

                  /// Agreee Terms Widget
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
}
