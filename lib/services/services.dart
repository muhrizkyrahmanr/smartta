import 'dart:convert';
import 'dart:io';

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

  LoginService(String email, String password, String token) async {
    var url = Uri.parse("$API_V2/userMasyarakat/login");
    try{
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json'
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
            'token': token
          }));
      var responseJson = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return responseJson;
      } else if(response.statusCode == 401){
        return 401;
      } else {
        return;
      }
    } on Exception catch (_) {
      return;
    }
  }

  DaftarService(String email, String password, String no_hp, String nama, File foto) async {
    var url = Uri.parse("$API_V2/userMasyarakat/create");
    try{
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['no_hp'] = no_hp;
      request.fields['nama'] = nama;
      request.files.add(await http.MultipartFile.fromPath('foto', foto.path));
      var res = await request.send();
      final respStr = await http.Response.fromStream(res);
      if (res.statusCode == 200) {
        if (respStr.body == 'null') {
          return;
        } else {
          var responseJson = json.decode(respStr.body);
          return responseJson;
        }
      } else if(res.statusCode == 401){
        return 401;
      } else {
        return;
      }
    } on Exception catch (_) {
      return;
    }
  }
}
