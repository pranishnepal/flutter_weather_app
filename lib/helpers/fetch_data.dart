import 'dart:convert';
import 'package:http/http.dart';

class FetchData {
  final String url;
  FetchData(this.url);

  Future<dynamic> getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
