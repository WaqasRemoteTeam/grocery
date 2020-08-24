import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:markets/src/elements/ReviewProductItem.dart';
import 'package:markets/src/models/product_category.dart';
import 'package:dropdownfield/dropdownfield.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http;
import 'CircularLoadingWidget.dart';

// ignore: must_be_immutable

class CustomerProductsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CustomerProductsListState();
  }

}

class _CustomerProductsListState  extends State<CustomerProductsList> {
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

  List <dynamic> productsList;

  String url = "http://skalani.in/multi/public/api/products/categories";

   Future<List<dynamic>> _getCategories() async {
    var data = await http.get(url);
    
    var jsonData = json.decode(data.body);
    return jsonData['data'];
    
  }

  @override
  void initState() {
    super.initState();
    _getCategories().then((value) => {
      setState((){
        productsList = value;
      })
    });


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Container(
      child: Column(
        children: <Widget>[
          new FutureBuilder
            (
             future: _getCategories(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                switch (snapshot.connectionState){

                  case ConnectionState.waiting:
                    return CircularLoadingWidget(height: 200);
                    break;
                  case ConnectionState.none:
                   return  CircularLoadingWidget(height: 200);
                    break;
                  default:
                    return ListView.separated(
                      padding: EdgeInsets.all(0),
                      itemBuilder: (context, index) {

                         return ReviewProductItemWidget(
                        product: snapshot.data.elementAt(index),

                       );
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                      itemCount: snapshot.data.length,
                      primary: false,
                      shrinkWrap: true,
                    );

                }
              }

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
