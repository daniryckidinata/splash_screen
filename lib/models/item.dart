import 'package:flutter/foundation.dart';
import 'package:splash_screen/helpers/helpers.dart';

class Item {
  String imageUrl;
  String title;
  String subtitle;

  Item({
    @required this.imageUrl,
    @required this.subtitle,
    @required this.title,
  });

  Item.fromJson(json) {
    imageUrl = json[MyStrings.imageUrl];
    title = json[MyStrings.title];
    subtitle = json[MyStrings.subtitle];
  }
}
