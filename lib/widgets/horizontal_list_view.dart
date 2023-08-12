import 'package:flutter/material.dart';
import 'package:interview/constants/uicolors.dart';
import 'package:interview/constants/uiicons.dart';
import 'package:interview/model/book.dart';
import 'package:interview/model/mocked_data.dart';

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({required Key key}) : super(key: key);

  @override
  HorizontalListViewState createState() => HorizontalListViewState();
}

class HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Continue',
              style: TextStyle(
                color: UiColors.titleColor,
                fontSize: 14,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bookContinueList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: continueListTile(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget continueListTile(int index) {
    final Book book = bookContinueList[index];
    final UiIcons myIcons = UiIcons();
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(45), // Image radius
                    child: book.cover,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: myIcons.playIcon,
              )
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Text(
            book.title,
            style: const TextStyle(
              color: UiColors.bookTitleColor,
              fontSize: 14,
              fontFamily: 'Rubik',
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Text(
            book.author,
            style: const TextStyle(
              color: UiColors.bookAuthorColor,
              fontSize: 12,
              fontFamily: 'Rubik',
            ),
          ),
        ],
      ),
    );
  }
}
