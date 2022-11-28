import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartta/model/model_artikel.dart';
import 'package:smartta/model/model_banner.dart';
import 'package:smartta/model/model_detail_jasa.dart';
import 'package:smartta/model/model_menu.dart';
import 'package:smartta/model/model_paket.dart';

import '../../utils/config.dart';

class Services {
  getBannerServices() async {
    var url = Uri.parse("$API_V2/getAllDataBanner");
    final response = await http.get(url);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      if (response.body == '{"data":null}') {
        return throw Exception('No results');
      } else {
        var data = responseJson['data'];
        return data.map((p) => ModelBanner.fromJson(p)).toList();
      }
    } else {
      throw Exception('Failed to load');
    }
  }

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

  getDetailDataServices(String id) async {
    var url = Uri.parse("$API_V2/getDetailServices");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, String>{
          'id_services': id,
        }));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      if (response.body == '{"data":null}') {
        return throw Exception('No results');
      } else {
        var baseResponse = ModelDetailJasa.fromJson(responseJson['data']);
        return baseResponse;
      }
    } else {
      throw Exception('Failed to load');
    }
  }

  getArtikelServices() async {
    var url = Uri.parse("$API_V2/getAllDataBerita");
    final response = await http.get(url);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      if (response.body == '{"data":null}') {
        return throw Exception('No results');
      } else {
        var data = responseJson['data'];
        return data.map((p) => ModelArtikel.fromJson(p)).toList();
      }
    } else {
      throw Exception('Failed to load');
    }
  }
}
