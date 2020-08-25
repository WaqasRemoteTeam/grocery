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
  List selectedValues;


  ReviewProductItemWidget({Key key, this.product, this.selectedValues}) : super(key: key);
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

    var _thirsValue = false;




    createSlotMap(List items){
      return Map.fromIterable(widget.product['product_slot'],
          key: (e)=> e['slots'],
          value: (e)=>false);
    }

    createSubscriptionMap(List items){
      return Map.fromIterable(widget.product['product_subscription'],
          key: (e)=> e['subscription'],
          value: (e)=>false);
    }



    List<DropdownMenuItem<dynamic>> _dropDownItemSlot(List items) {

      var slots = createSlotMap(items);

      return slots.keys.map((key) =>
          DropdownMenuItem(
              child: Container(
                width: 200,
                child: StatefulBuilder(
                  builder: (BuildContext context,StateSetter _setState){
                    return  CheckboxListTile(
                      title: Text(key.toString()),
                      value: slots[key],
                      onChanged: (bool value) {
                        print("${key.toString()} "+value.toString());
                        _setState(() {
                          slots[key] = value;
                          if (value == true){
                            widget.selectedValues.add(key.toString());
                          }
                        });
                      },
                    );
                  },
                ),
              )
          )

      ).toList();
    /*  return items
          .map((value) =>  DropdownMenuItem(
          child: Container(
            width: 200,
            child: StatefulBuilder(
              builder: (BuildContext context,StateSetter _setState){
                return  CheckboxListTile(
                  title: Text(value['slots'].toString()),
                  value: _isChecked,
                  onChanged: (bool value) {
                    print("value is"+value.toString());
                    _setState(() {
                      _isChecked = value;
                    });
                  },
                );
              },
            ),
          )
      )).toList();*/
    }
    List<DropdownMenuItem<dynamic>> _dropDownItemSubscriptions(List items) {

      var subscriptions = createSubscriptionMap(items);

      return createSubscriptionMap(items)
        .keys.map((key) =>
          DropdownMenuItem(
              child: Container(
                width: 200,
                child: StatefulBuilder(
                  builder: (BuildContext context,StateSetter _setState){
                    return  CheckboxListTile(
                      title: Text(key.toString()),
                      value: subscriptions[key],
                      onChanged: (bool value) {

                        _setState(() {
                          subscriptions[key] = value;
                          if (value == true){
                            widget.selectedValues.add(key.toString());
                          }

                        });
                      },
                    );
                  },
                ),
              )
          )

      ).toList();

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
