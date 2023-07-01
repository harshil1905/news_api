import 'package:http/http.dart' as http;
import 'package:news_api/get_apk_calling/tesla_model.dart';

class NetWorkTesla {
  static Future<Tesla> fachTesla() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2603af4fbaf3447785d7ba3f0429478a'));
    if (response.statusCode == 200) {
      return teslaFromJson(response.body);
    } else {
      throw Exception('error');
    }
  }
}
