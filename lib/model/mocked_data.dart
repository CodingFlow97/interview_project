import 'package:flutter/material.dart';
import 'package:interview/model/Cover.dart';

import 'package:interview/model/book.dart';

// Cover cover = Cover();
// cover.loadImages();

Image cover1 = Image.network('https://picsum.photos/id/677/100');
Image cover2 = Image.network('https://picsum.photos/id/881/75/100');
Image cover3 = Image.network('https://picsum.photos/id/603/75/100');
Image cover4 = Image.network('https://picsum.photos/id/523/75/100');

List<Book> bookContinueList = [
  Book("My Book Cover", "A lot of authors", "05 Jan 2023", cover1),
  Book("My Book Cover", "A lot of authors", "05 Jan 2023", cover1),
  Book("My Book Cover", "A lot of authors", "05 Jan 2023", cover1),
  Book("My Book Cover", "A lot of authors", "05 Jan 2023", cover1),
];

List<Book> bookNewList = [
  Book("My Book Cover2", "A lot of authors", "25 Apr 2023", cover2),
  Book("My Book Cover2", "A lot of authors", "25 Apr 2023", cover2),
  Book("More Than Words", "John Sullivan", "04 Feb 2023", cover3),
  Book("The Tiny Dragon", "Storywasy Orignal & Rupert Cartet", "23 Jun 2022", cover4),
  Book("The Tiny Dragon - Part 2", "Storywasy Orignal & Rupert Cartet", "17 Aug 2023", cover4),
  Book("It´s a Book Cover", "A lot of authors", "05 Jan 2023", cover3),
  Book("It´s a Book Cover two", "A lot of authors", "05 Jan 2023", cover3)
];
