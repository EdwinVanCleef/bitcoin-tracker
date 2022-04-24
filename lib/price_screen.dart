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
  CoinData coinData = CoinData();
  Map<String, String> coinMap = {};

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

  Future<void> getDefaultCoinData() async {
    Map<String, String> getCoinData =
        await coinData.getCoinData(selectedCurrency);

    setState(() {
      coinMap = getCoinData;
    });
  }

  @override
  void initState() {
    getDefaultCoinData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 0; i < coinMap.length; i++)
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 ' +
                        coinMap.keys.toList()[i].toString() +
                        ' = ' +
                        coinMap.values.toList()[i].toString() +
                        ' $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 20.0,
              width: double.infinity,
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
              onSelectedItemChanged: (selectedIndex) async {
                String currency = currenciesList[selectedIndex].toString();
                Map<String, String> getCoinData =
                    await coinData.getCoinData(selectedCurrency);

                setState(() {
                  selectedCurrency = currency;
                  coinMap = getCoinData;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
