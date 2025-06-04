import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'Failed to post data ${response.statusCode} with body: ${response.body}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    });
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'Failed to post data ${response.statusCode} with body: ${response.body}',
      );
    }
  }
}
