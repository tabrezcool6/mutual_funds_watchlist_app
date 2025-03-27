import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_watchlist/core/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/core/theme/text_styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    required this.selectedIndex,
    required this.onItemTap,
    super.key,
  });

  final int selectedIndex;
  final void Function(int)? onItemTap;

  @override
  Widget build(BuildContext context) {
    var borderSide = BorderSide(width: 0.2, color: AppPallete.doveGrey800Color);

    ///
    return Container(
      height: 82.0,
      decoration: BoxDecoration(
        border: Border(top: borderSide, bottom: borderSide),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
        
          unselectedLabelStyle: TextStyles.customSizeColorTextStyle(
            fontSize: 12.0,
            color: AppPallete.doveGrey600Color,
          ),
       
          selectedLabelStyle: TextStyles.customSizeColorTextStyle(
            fontSize: 12.0,
            color: AppPallete.primaryColor,
          ),
          selectedItemColor: AppPallete.primaryColor,

          backgroundColor: AppPallete.bgColor,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 6.0), //, left: 60.0
                child: Column(
                  children: [
                    SvgPicture.asset(
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        selectedIndex == 0
                            ? AppPallete.primaryColor
                            : AppPallete.doveGrey600Color,
                        BlendMode.srcATop,
                      ),
                      AssetsPath.NAV_HOME_SVG,
                    ),
                    // SizedBox(height: 6.0),
                    // Text('Home'),
                  ],
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: SvgPicture.asset(
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    selectedIndex == 1
                        ? AppPallete.primaryColor
                        : AppPallete.doveGrey600Color,
                    BlendMode.srcATop,
                  ),
                  // color: Colors.red,
                  AssetsPath.NAV_CHARTS_SVG,
                ),
              ),

              label: 'Charts',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 6.0), // , right: 60.0
                child: Column(
                  children: [
                    SvgPicture.asset(
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        selectedIndex == 2
                            ? AppPallete.primaryColor
                            : AppPallete.doveGrey600Color,
                        BlendMode.srcATop,
                      ),
                      AssetsPath.NAV_WATCHLIST_SVG,
                    ),
                  ],
                ),
              ),
              label: 'Watchlist',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTap,
        ),
      ),
    );
  }
}
