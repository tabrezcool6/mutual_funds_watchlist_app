import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/loader.dart';
import 'package:mutual_funds_watchlist/core/common/widgets/primary_button.dart';
import 'package:mutual_funds_watchlist/core/constants/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';
import 'package:mutual_funds_watchlist/core/utils.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/pages/signin_page.dart';

// TODO:-
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.transparentColor,
      body:
      /// using bloc widget to access auth signout events and states
      BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            Utils.showSnackBar(context, state.message);
          } else if (state is AuthSignOutSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              SignInPage.route(),
              (context) => false,
            );
          }
        },
        builder: (context, state) {
          return Drawer(
            backgroundColor: AppPallete.bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// top logo widget
                _topLogoDecorationWidget(),

                /// sign out button
                if (state is AuthLoading) ...[
                  Loader(),
                ] else ...[
                  _signoutButton(context, state),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  /// Logo on Top Decoration
  Container _topLogoDecorationWidget() {
    return Container(
      margin: EdgeInsets.only(top: 66.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.2, color: AppPallete.doveGrey800Color),
          bottom: BorderSide(width: 0.2, color: AppPallete.doveGrey800Color),
        ),
      ),
      child: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AssetsPath.HOME_LOGO_SVG,
                  width: 20.22,
                  height: 27,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// SignOut Button
  Padding _signoutButton(BuildContext context, AuthState state) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: PrimaryButton(
        width: 120,
        widget: TextStyles.customMedium500Text(
          'Sign Out',
          textSize: 14.0,
          color: AppPallete.errorColor,
        ),

        onPressed: () {
          context.read<AuthBloc>().add(AuthSignOutEvent());
        },
      ),
    );
  }
}
