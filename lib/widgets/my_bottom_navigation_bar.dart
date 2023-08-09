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
      backgroundColor: Colors.black, //UiColors.bottomNavBarBgColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              myIcons.dashboardIcon,
              const Padding(padding: EdgeInsets.only(left: 3)),
              const Text('Home', style: TextStyle(color: UiColors.titleColor, fontSize: 12, fontFamily: 'Rubik'), textAlign: TextAlign.center,)
            ],
          ),
          // icon: myIcons.dashboardIcon,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: myIcons.stackIcon,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: myIcons.compassIcon,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: myIcons.forwardIcon,
          label: '',
        ),
      ],
      currentIndex: 0,
      // selectedItemColor: Colors.black,
      // onTap: () => (),
    );
  }
}
