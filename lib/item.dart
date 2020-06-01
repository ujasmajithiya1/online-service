import 'package:flutter/material.dart';
class Items extends StatelessWidget {
  Items({
    @required this.leftAligned,
    @required this.itemName,
    @required this.itemPrice,
  });

  final bool leftAligned;
  final String itemName;
  final double itemPrice;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  width: double.infinity,
                  height: 20,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                      left: leftAligned
                          ? Radius.circular(0)
                          : Radius.circular(containerBorderRadius),
                      right: leftAligned
                          ? Radius.circular(containerBorderRadius)
                          : Radius.circular(0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.only(
                      left:10,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(itemName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    )),
                              ),
                              Text("\R\s\. $itemPrice",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                          SizedBox(height: 10),
//                          Align(
//                            alignment: Alignment.centerLeft,
//                            child: RichText(
//                              text: TextSpan(
//                                  style: TextStyle(
//                                      color: Colors.black45, fontSize: 15),
//                                  children: [
//                                    TextSpan(text: "by "),
//                                    TextSpan(
//                                        text: hotel,
//                                        style: TextStyle(
//                                            fontWeight: FontWeight.w700))
//                                  ]),
//                            ),
//                          ),
                          //SizedBox(height: containerPadding),
                        ])),
              ],
            ),
          ),
        )
      ],
    );
  }
}