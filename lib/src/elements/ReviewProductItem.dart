import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:markets/src/models/product_category.dart';

import '../helpers/helper.dart';
import '../models/product.dart';

// ignore: must_be_immutable

/*dsd*/


class ReviewProductItemWidget extends StatefulWidget {

  dynamic product;


  ReviewProductItemWidget({Key key, this.product}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReviewProductItemWidgetState();
  }

}
class _ReviewProductItemWidgetState extends State<ReviewProductItemWidget>{

  @override
  Widget build(BuildContext context) {


   // print("object"+widget.productd['name']);



    var _value= 1;
    var _firstValue = false;
    var _top = false;
    var _secondValue = false;
    var _thirsValue = false;
    var _fourthValue = false;
    var _subfirstValue = false;
    var _subsecondValue = false;
    var _subthirsValue = false;
    var _subfourthValue = false;

    List<DropdownMenuItem<dynamic>> _dropDownItemSlot(List items) {
      return items
          .map((value) =>  DropdownMenuItem(
          child: Container(
            width: 200,
            child: StatefulBuilder(
              builder: (BuildContext context,StateSetter _setState){
                return  CheckboxListTile(
                  title: Text(value['slots'].toString()),
                  value: _thirsValue,
                  onChanged: (bool value) {
                    _setState(() {
                      _thirsValue = value;
                    });
                  },
                );
              },
            ),
          )
      )).toList();
    }
    List<DropdownMenuItem<dynamic>> _dropDownItemSubscriptions(List items) {

      print(items.toString());
      return items
          .map((value) =>  DropdownMenuItem(
          child: Container(
            width: 200,
            child: StatefulBuilder(
              builder: (BuildContext context,StateSetter _setState){
                return  CheckboxListTile(
                  title: Text(value['subscription'].toString()),
                  value: _thirsValue,
                  onChanged: (bool value) {
                    _setState(() {
                      _thirsValue = value;
                    });
                  },
                );
              },
            ),
          )
      )).toList();
    }
    return InkWell(
        onTap: () {},
        child: Wrap(
          direction: Axis.horizontal,
          runSpacing: 10,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                SizedBox(width: 15),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              widget.product['name'],
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).hintColor)),
                            ),

                          ),
                          SizedBox(
                            height: 32,

                            child: widget.product['product_slot'].length > 0 ?
                            DropdownButton(
                              items: _dropDownItemSlot(widget.product['product_slot']),
                              onChanged: (value) {
                              },
                              hint: Text('ON demand'),
                            )
                           : DropdownButton(
                              items: widget.product['product_subscription'].length > 0 ? _dropDownItemSubscriptions(widget.product['product_subscription'])
                               :[
                              DropdownMenuItem(
                              child: Container(
                              width: 200,
                              child: StatefulBuilder(
                                builder: (BuildContext context,StateSetter _setState){
                                  return  CheckboxListTile(
                                    title: Text("On demand"),
                                    value: _thirsValue,
                                    onChanged: (bool value) {
                                      _setState(() {
                                        _thirsValue = value;
                                      });
                                    },
                                  );
                                },
                              ),
                            )
                          )
                              ]
                              ,
                              onChanged: (value) {
                              },
                              hint: Text('On demand'),
                              ),
                            )


                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),


          ],
        ));


  }
}
