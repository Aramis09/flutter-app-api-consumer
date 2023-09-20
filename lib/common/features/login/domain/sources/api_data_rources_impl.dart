import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/models/login_user_model.dart';
import 'data_sources_bases.dart';

String baseUrl = "https://servidor-unse.onrender.com";

class ApiDataSourcesImpl extends DataSourcesLoginBases {
  @override
  Future<LoginUserModel> verifyUser(
      {required String user, required String password}) async {
    final body = Body(user: user, password: password).toJson();
    http.Response responseApi = await _makeRequest('$baseUrl/login', body);
    return LoginUserModel.fromJson(jsonDecode(responseApi.body));
  }

//!0------------logic--------logic--------logic--------logic--------logic--------logic--------logic
  Future<http.Response> _makeRequest(String url, dynamic body) async {
    final response = await http.Client().post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'auth-secret-key': 'CLAVESECRETA'
        },
        body: jsonEncode(body));
    return response;
  }
}

class Body {
  String user;
  String password;

  Body({required this.user, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'password': password,
    };
  }
}
