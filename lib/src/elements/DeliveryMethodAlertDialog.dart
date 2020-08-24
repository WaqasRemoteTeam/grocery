import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:markets/src/elements/product_list_delivery_dialog.dart';
import 'package:markets/src/models/product_category.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


import '../../generated/l10n.dart';
import 'ReviewsListWidget.dart';

import 'package:http/http.dart' as http;

class DeliveryMethodAlertDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DeliveryMethodAlertDialogState();
  }
}

class _DeliveryMethodAlertDialogState extends State<DeliveryMethodAlertDialog> {




  String  url = "http://skalani.in/multi/public/api/products/categories";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,

            title: Text(
              S.of(context).delivery_or_pickup_delivery_method,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .merge(TextStyle(letterSpacing: 1.1)),
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomerProductsList()
              ),
            ],
          ),
        ));
  }


  Future<List<Datum>> _getCategories() async{
    var data = await http.get(url);


    var jsonData= json.decode(data.body);
    var _jsons = jsonData["data"];

    if (jsonData['sucess'] == true){
      print(_jsons);
      return _jsons;
    }else{
      return null;
    }


  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }
}
