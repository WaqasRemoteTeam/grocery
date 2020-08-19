import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

import '../helpers/helper.dart';
import '../models/product.dart';

// ignore: must_be_immutable


class ReviewProductItemWidget extends StatefulWidget {

  String product;

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
    return StatefulBuilder(builder: (BuildContext context,StateSetter setState){
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
                              widget.product,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).hintColor)),
                            ),

                          ),
                          SizedBox(
                            height: 32,
                            child:widget.product == "Paneer" ?DropdownButton(
                              items: [
                                DropdownMenuItem(
                                    child: Text("Slot")
                                ),
                                DropdownMenuItem(
                                  child: Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                      title: const Text('Slot 1'),
                                      value: _firstValue,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _firstValue = value;
                                        });
                                      },

                                    ),

                                  ),
                                ),
                                DropdownMenuItem(
                                  child: Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                      title: const Text('Slot 2'),
                                      value: _secondValue,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _secondValue= value;
                                        });
                                      },

                                    ),

                                  ),
                                ),DropdownMenuItem(
                                  child: Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                      title: const Text('Slot 3'),
                                      value: _thirsValue,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _thirsValue = value;
                                        });
                                      },

                                    ),

                                  ),
                                ),DropdownMenuItem(
                                  child: Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                      title: const Text('Slot 4'),
                                      value: _fourthValue,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _fourthValue = value;
                                        });
                                      },

                                    ),

                                  ),
                                ),

                              ],
                              onChanged: (value) {
                              },
                              hint: Text('Select value'),
                            ):DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text("Subscription")
                                ),
                                DropdownMenuItem(
                                  child: Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                        title: const Text('5 days'),
                                        value: _subfirstValue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _subfirstValue = value;
                                          });
                                        },
                                      
                                      ),

                                  ),
                                ),
                                DropdownMenuItem(
                                  child: Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                        title: const Text('10 days'),
                                        value: _secondValue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _secondValue = value;
                                          });
                                        },

                                      ),

                                  ),
                                ),
                                DropdownMenuItem(
                                  child: Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                        title: const Text('15 days'),
                                        value: _subthirsValue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _subthirsValue = value;
                                          });
                                        },

                                      ),

                                  ),
                                ),


                              ],
                              onChanged: (value) {
                              },
                              hint: Text('Select value'),
                            ),

                          ),


                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),


          ],
        ),
      );
    });

  }
}
