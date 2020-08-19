import 'package:flutter/material.dart';

import '../elements/CategoriesCarouselItemWidget.dart';
import '../elements/CircularLoadingWidget.dart';
import '../models/category.dart';

// ignore: must_be_immutable
class CategoriesCarouselWidget extends StatefulWidget {
  List<Category> categories;

  CategoriesCarouselWidget({Key key, this.categories}) : super(key: key);

  @override
  _CategoriesCarouselWidgetState createState() =>
      _CategoriesCarouselWidgetState();
}

class _CategoriesCarouselWidgetState extends State<CategoriesCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return this.widget.categories.isEmpty
        ? CircularLoadingWidget(height: 150)
        : Container(
            height: 170,
            padding: EdgeInsets.symmetric(vertical: 0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: this.widget.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.5),
              itemBuilder: (context, index) {
                double _marginLeft = 0;
                (index == 0) ? _marginLeft = 0 : _marginLeft = 0;
                return new CategoriesCarouselItemWidget(
                  marginLeft: _marginLeft,
                  category: this.widget.categories.elementAt(index),
                );
              },
            ));
  }
}
