import 'package:flutter/material.dart';
import 'package:interview/constants/uiicons.dart';
import 'package:interview/constants/uicolors.dart';
import 'package:interview/model/mocked_data.dart';
import 'package:interview/widgets/horizontal_list_view.dart';
import 'package:interview/widgets/my_bottom_navigation_bar.dart';

import 'package:interview/model/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: bookNewList.length + 1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return HorizontalListView(
                      key: UniqueKey(),
                    );
                  } else if (index == 1) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'New',
                        style: TextStyle(
                          color: UiColors.titleColor,
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    index -= 1;
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: newListTile(index),
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  if(index > 1){
                    return const Divider();
                  }
                  return const Padding(padding: EdgeInsets.only(left: 0));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        key: UniqueKey(),
      ),
    );
  }

  Widget newListTile(int index) {
    final Book book = bookNewList[index];
    final UiIcons myIcons = UiIcons();
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SizedBox(
            width: 75,
            height: 100,
            child: book.cover,
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 10)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: const TextStyle(
                color: UiColors.bookTitleColor,
                fontSize: 14,
                fontFamily: 'Rubik',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            Text(
              book.author,
              style: const TextStyle(
                color: UiColors.bookAuthorColor,
                fontSize: 12,
                fontFamily: 'Rubik',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Wrap(
              children: [
                myIcons.calendarIcon,
                const Padding(padding: EdgeInsets.only(left: 8)),
                Text(
                  book.releaseDate,
                  style: const TextStyle(
                    color: UiColors.bookAuthorColor,
                    fontSize: 12,
                    fontFamily: 'Rubik',
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        myIcons.bellIcon,
      ],
    );
  }
}
