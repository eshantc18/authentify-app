import 'dart:convert';

import 'package:http/http.dart' as http;

const api_key = 'X73NDWDC4YCEZABC1DUSXRU5Z9Y2V18Q6D';
const url = 'https://api.etherscan.io/api';
const action = 'eth_getTransactionByHash';
const mod = 'proxy';

class API {
  final String hash;
  API(this.hash);

  static Future<bool> isVerified(String hash) async {
    try {
      var response = await http.get(
        Uri.parse(
            "$url?module=$mod&action=$action&txhash=$hash&apikey=$api_key"),    
      );
      
      Map jsonResponse = jsonDecode(response.body);
      
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
