import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/MainMenus/DashboardPage/index.dart';
import 'package:kumande/Pages/MainMenus/HistoryPage/index.dart';
import 'package:kumande/Pages/MainMenus/ProfilePage/index.dart';
import 'package:kumande/Pages/MainMenus/SchedulePage/index.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const DashboardPage(),
      const HistoryPage(),
      const SchedulePage(),
      const ProfilePage()
    ];
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.dashboard, size: iconLG, color: whiteBg),
            Icon(Icons.history, size: iconLG, color: whiteBg),
            Icon(Icons.calendar_month, size: iconLG, color: whiteBg),
            Icon(Icons.person, size: iconLG, color: whiteBg),
          ],
          color: primaryBg,
          buttonBackgroundColor: primaryBg,
          backgroundColor: whiteBg,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: widgetOptions.elementAt(_page));
  }
}
