// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:btc/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<Text> getMenuItems(List<String> listName) {
    List<Text> pickerItems = [];
    for (String item in listName) {
      pickerItems.add(
        Text(
          item,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              children: getMenuItems(currenciesList),
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex) {
                setState(() {
                  selectedCurrency = currenciesList[selectedIndex].toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
