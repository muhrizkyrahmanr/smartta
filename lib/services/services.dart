import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartta/model/model_menu.dart';

import '../../utils/config.dart';

class Services {
  getDataServices() async {
    var url = Uri.parse("$API_V2/getAllDataServices");
    final response = await http.get(url);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      if (response.body == '{"data":null}') {
        return throw Exception('No results');
      } else {
        var data = responseJson['data'];
        return data.map((p) => ModelMenu.fromJson(p)).toList();
      }
    } else {
      throw Exception('Failed to load');
    }
  }
}
