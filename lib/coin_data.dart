import 'dart:convert' as convert;
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

const String apiURL = 'https://rest.coinapi.io/v1/exchangerate';
const String apiKey = 'apikey=0F3063E9-3142-4DBF-99F4-F805C329CC9D';

class CoinData {
  Future getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String url = '$apiURL/$crypto/$currency?$apiKey';
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedData = convert.jsonDecode(response.body);
        return decodedData['rate'];
      } else {
        print('Request failed with Status code:' +
            response.statusCode.toString());
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
