import 'package:flutter/material.dart';

class Cover {
  late Image image1, image2, image3, image4;

  void loadImages() {
    image1 = Image.network('https://picsum.photos/id/677/200/300');
    image2 = Image.network('https://picsum.photos/id/881/200/300');
    image3 = Image.network('https://picsum.photos/id/603/200/300');
    image4 = Image.network('https://picsum.photos/id/523/200/300');
  }
}
