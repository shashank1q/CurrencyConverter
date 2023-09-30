import 'package:currency_converter/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Data {
  static List<String> currencyName = []; //['IND', 'PAK', 'SL'];
  static List<String> currencyRate = []; //['2.3', '45.0', '4.5'];

  static Future<int> getData() async {
    if (currencyName.isNotEmpty) {
      return 0;
    }
    try {
      final response = await http.get(Uri.parse(url));
      final code = response.statusCode;
      if (code == 200) {
        //print('response: ${response.body}');
        Map<String, dynamic> json = convert.jsonDecode(response.body)['rates'];
        json.forEach((key, value) {
          currencyName.add(key);
          currencyRate.add(value.toString());
        });
      } else {
        //print('Code $code');
        return code;
      }
      return 0;
    } catch (e) {
      //print('error: $e');
      return -1;
    }
  }

  static String calculate(int fromIndex, int toIndex, {String amount = '1'}) {
    // getting rate of 1 EUR for 'FromCurrency'
    double fromrate = double.parse(currencyRate[fromIndex]);
    // getting entered amount in EUR
    double eur = 1 / fromrate * double.parse(amount);
    // converting that EUR amount to 'to currency'
    double res = double.parse(currencyRate[toIndex]) * eur;
    return res.toString();
  }
}
