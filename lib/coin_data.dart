import 'package:http/http.dart' as http;
import 'dart:convert';

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

class CoinData {
  String _apiKey = 'C67190EC-0642-4219-B137-38CEC9C59A44';

  Future _getJsonData(uri) async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> _getSpecificCoinData(String coinName, String currency) async {
    String uri =
        'https://rest.coinapi.io/v1/exchangerate/$coinName/$currency?apiKey=$_apiKey';
    var dataCoin = await _getJsonData(uri);
    var rate = dataCoin['rate'];
    return rate;
  }

  Future<dynamic> allCoinData(String currency) async {
    List<String> coinData = [];
    for(int i = 0; i<cryptoList.length; i++){
      double rate = await _getSpecificCoinData(cryptoList[i], currency);
      coinData.add(rate.toString());
    }
    return coinData;
  }

}
