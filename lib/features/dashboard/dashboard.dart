import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mutual_funds_watchlist/core/constants.dart';
import 'package:mutual_funds_watchlist/core/theme/app_pallete.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/widgets/auth_home_indicator.dart';
import 'package:mutual_funds_watchlist/features/dashboard/nav_pages/charts_page.dart';
import 'package:mutual_funds_watchlist/features/dashboard/nav_pages/home_page.dart';
import 'package:mutual_funds_watchlist/features/dashboard/nav_pages/watchlist_page.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/bottom_nav_bar.dart';
import 'package:mutual_funds_watchlist/features/dashboard/widgets/drawer_widget.dart';

/// TODO:-
class Dashboard extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const Dashboard());

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), ChartsPage(), WatchlistPage()];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.bgColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Appbar Widgets for Pages
          if (_selectedIndex == 0) ...[
            _appbarHomeWidgets(),
          ] else if (_selectedIndex == 1) ...[
            _appbarChartsWidgets(),
          ] else ...[
            _appbarWatchlistWidgets(),
          ],

          Expanded(child: _pages[_selectedIndex]),

          CustomBottomNavBar(
            selectedIndex: _selectedIndex,
            onItemTap: _onItemTap,
          ),

          AuthHomeIndicator(topMargin: 21),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }

  ///
  ///
  /// Page 1 - Home Appbar Widgets
  Container _appbarHomeWidgets() {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AssetsPath.HOME_LOGO_SVG,
                  width: 20.22,
                  height: 27,
                ),
                GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: SvgPicture.asset(
                    AssetsPath.HOME_MENU_SVG,
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ///
  ///
  /// Page 2 - Charts Appbar Widgets
  Container _appbarChartsWidgets() {
    return Container(
      height: 42,
      margin: EdgeInsets.only(top: 66.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AssetsPath.WATCHLIST_ARROW_BACK_SVG,
              width: 18,
              height: 18,
            ),
            SizedBox(width: 6.87),
            SvgPicture.asset(
              AssetsPath.WATCHLIST_BOOKMARK_SVG,
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///
  /// Page 3 - Watchlists Appbar Widgets
  Container _appbarWatchlistWidgets() {
    return Container(
      height: 42,
      margin: EdgeInsets.only(top: 66.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AssetsPath.WATCHLIST_ARROW_BACK_SVG,
              width: 18,
              height: 18,
            ),
            SizedBox(width: 6.87),
            Text(
              "Watchlist",
              style: TextStyle(
                fontSize: 20.0,
                color: AppPallete.whiteColor,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
}
