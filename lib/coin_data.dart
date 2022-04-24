import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String apiKey = '';
const String baseURL = 'https://rest.coinapi.io';

class CoinData {
  Future<Map<String, String>> getCoinData(String currency) async {
    Map<String, String> coinMap = {};

    for (String coinType in cryptoList) {
      var url = Uri.parse(
          '$baseURL/v1/exchangerate/$coinType/$currency?apikey=$apiKey');

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        coinMap[coinType] = decodedData['rate'].toStringAsFixed(2);
      }
    }

    return coinMap;
  }
}

// https://www.coinapi.io/
// api
