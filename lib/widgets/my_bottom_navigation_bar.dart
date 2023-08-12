import 'package:flutter/material.dart';
import 'package:interview/constants/uicolors.dart';
import 'package:interview/constants/uiicons.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({required Key key}) : super(key: key);

  @override
  MyBottomNavigationBarState createState() => MyBottomNavigationBarState();
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final UiIcons myIcons = UiIcons();
    return BottomNavigationBar(
      backgroundColor: UiColors.bottomNavBarBgColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: UiColors.bottomNavBarBgColor,
          icon: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                myIcons.dashboardIcon,
                const Padding(padding: EdgeInsets.only(left: 3)),
                const Text(
                  'Home',
                  style: TextStyle(
                    color: UiColors.titleColor,
                    fontSize: 12,
                    fontFamily: 'Rubik',
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: UiColors.bottomNavBarBgColor,
          icon: myIcons.stackIcon,
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: UiColors.bottomNavBarBgColor,
          icon: myIcons.compassIcon,
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: UiColors.bottomNavBarBgColor,
          icon: myIcons.forwardIcon,
          label: '',
        ),
      ],
      currentIndex: 0,
    );
  }
}
