import 'package:flutter/material.dart';
import 'package:mutual_funds_watchlist/core/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';

/// TODO: today
class AuthBaseClassWidget extends StatelessWidget {
  const AuthBaseClassWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppPallete.bgColor,
      body: ClipRect(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform(
              transform:
                  Matrix4.identity()
                    // Adjust scale to zoom in/out the background image
                    ..scale(1.9)
                    // Move the image inward from the left to adjust the background image
                    ..translate(-120.0, 0.0),
              alignment:
                  Alignment.bottomLeft, // Ensure zoom starts from bottom left
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsPath.AUTH_BACKGROUND),
                    fit: BoxFit.cover,
                    // 5% was to much of opacity, so have used value for best appeareance
                    opacity: 0.01,
                  ),
                ),
              ),
            ),

            /// Child Widget in Base configurations
            child,
          ],
        ),
      ),
    );
  }
}
