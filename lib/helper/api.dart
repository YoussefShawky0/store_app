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
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    // Encode body as JSON string if it's a Map or List
    String? encodedBody;
    if (body != null) {
      if (body is String) {
        encodedBody = body;
      } else {
        encodedBody = jsonEncode(body);
      }
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: encodedBody,
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
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    // Encode body as JSON string if it's a Map or List
    String? encodedBody;
    if (body != null) {
      if (body is String) {
        encodedBody = body;
      } else {
        encodedBody = jsonEncode(body);
      }
    }

    final response = await http.put(
      Uri.parse(url),
      body: encodedBody,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body.isNotEmpty) {
        try {
          final data = jsonDecode(response.body);
          return data;
        } catch (e) {
          throw Exception('Failed to parse JSON response: $e');
        }
      } else {
        // Return empty map for successful requests with no body
        return <String, dynamic>{};
      }
    } else {
      throw Exception(
        'Failed to update data: ${response.statusCode} with body: ${response.body}',
      );
    }
  }
}