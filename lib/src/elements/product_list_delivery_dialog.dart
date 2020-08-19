import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:markets/src/elements/ReviewProductItem.dart';
import 'package:markets/src/models/product_category.dart';
import 'package:dropdownfield/dropdownfield.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http;
import 'CircularLoadingWidget.dart';

// ignore: must_be_immutable
class CustomerProductsList extends StatelessWidget {
  List<String> productsOrderList = [
    "Paneer",
    "Rice",
    "Fish",
    "Spaghetti",
    "Bread",
    "Tuna Steak",
    "Arcbose",
    "Vinegar",
    "Sandwich",
    "Cupcake",
    "Cheese",
    "Salad",
    "Honey"
  ];

  String url = "http://skalani.in/multi/public/api/products/categories";

  Future<List<Datum>> _getCategories() async {
    var data = await http.get(url);

    var jsonData = json.decode(data.body);
    var _jsons = jsonData["data"];

    if (jsonData['sucess'] == true) {
      return _jsons;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Column(
        children: <Widget>[
          productsOrderList.isEmpty
              ? CircularLoadingWidget(height: 200)
              : ListView.separated(
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return ReviewProductItemWidget(
                        product: productsOrderList.elementAt(index));
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                  ),
                  itemCount: productsOrderList.length,
                  primary: false,
                  shrinkWrap: true,
                ),

            RaisedButton(
              
              onPressed: (){
                Navigator.pop(context);
              },
                child: Text("OK"),
              textColor: Colors.white,
              color:Color(0xFF26D467)
            )
        ],
      ),
    );
  }
}
