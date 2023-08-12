import 'package:flutter/material.dart';
import 'package:interview/constants/uicolors.dart';
import 'package:interview/constants/uiicons.dart';
import 'package:interview/model/book.dart';
import 'package:interview/model/debouncer.dart';
import 'package:interview/model/mocked_data.dart';
import 'package:interview/widgets/horizontal_list_view.dart';
import 'package:interview/widgets/my_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 350);
  final List<Book> _data = List.from(bookContinueList)..addAll(bookNewList);
  final List<Book> _results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        title: TextField(
          controller: _textController,
          onChanged: (text) => performSearch(text),
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Search for something',
            border: InputBorder.none,
            hintStyle: const TextStyle(color: UiColors.searchbarHintColor),
            suffixIcon: IconButton(
              icon:
                  const Icon(Icons.search, color: UiColors.searchbarHintColor),
              onPressed: () {
                performSearch('');
              },
            ),
          ),
        ),
      ),
      // ),
      body: Center(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => closeOverlayList(),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 5)),
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
                          return InkWell(
                            onTap: () => closeOverlayList(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: newListTile(index),
                            ),
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        if (index > 1) {
                          return const Divider(indent: 10, endIndent: 10);
                        }
                        return const Padding(padding: EdgeInsets.only(left: 0));
                      },
                    ),
                  ),
                  // The overlay

                  // ),
                ],
              ),
            ),
            Visibility(
              visible: _results.isNotEmpty || _textController.text.isNotEmpty,
              child: Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: _results.isEmpty
                        ? Container(
                            color: Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                            child: const Text('no results found',
                                style: TextStyle(
                                  color: UiColors.bookAuthorColor,
                                ),
                                textAlign: TextAlign.center),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: searchResultTile(_results[index]),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: _results.length,
                          ),
                  ),
                ),
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

  //Custom Listwidget for the New Section
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

  void closeOverlayList() {
    setState(() {
      _textController.clear();
      _results.clear();
    });
  }

  //method to search in the given list, search automatically after 350 milliseconds
  //when users stops typing
  void performSearch(String text) {
    final String myText = text.isNotEmpty ? text : _textController.text;
    _debouncer.run(
      () => setState(() {
        _results.clear();
        for (Book item in _data) {
          if (myText.isNotEmpty &&
              item.title.toLowerCase().contains(myText.toLowerCase())) {
            _results.add(item);
          }
        }
      }),
    );
  }

  //Custom Listwidget to show necessary information for the search results
  Widget searchResultTile(Book book) {
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
          ],
        ),
      ],
    );
  }
}
