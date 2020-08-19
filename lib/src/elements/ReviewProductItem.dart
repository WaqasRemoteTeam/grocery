import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

import '../helpers/helper.dart';
import '../models/product.dart';

// ignore: must_be_immutable
class ReviewProductItemWidget extends StatelessWidget {
  String product;

  ReviewProductItemWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _value= 1;
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
                              product,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).hintColor)),
                            ),

                        ),
                        SizedBox(
                          height: 32,
                          child:product == "Paneer" ? DropdownButton(
                              value: _value= 1,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Slot 1"),
                                  value: 1,
                                ),
                              ],
                              onChanged: (value) {

                              }) : DropdownButton(
                              value: _value= 1,
                              items: [
                                DropdownMenuItem(
                                  child: Text("on demand"),
                                  value: 1,
                                ),
                              ],
                              onChanged: (value) {

                              }),

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
  }
}
