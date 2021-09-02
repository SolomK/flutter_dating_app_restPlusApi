import 'dart:convert';

import 'package:dating/dating/models/models.dart';



import 'package:http/http.dart' as http;

class DatingDataProvider {
  final _baseUrl = 'http://192.168.56.1:3000';
  final http.Client httpClient;

  // ignore: unnecessary_null_comparison
  DatingDataProvider({ required this.httpClient}) : assert(httpClient != null);

  Future<Dating> createDating(Dating dating) async {
    final response = await httpClient.post(
      Uri.http('192.168.56.1:3000', '/.....'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': dating.username,
        'password': dating.password,
      
      }),
    );

    if (response.statusCode == 200) {
      return Dating.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<Dating>> getDating() async {
    final response = await httpClient.get( Uri.parse('$_baseUrl/courses/'),);

    if (response.statusCode == 200) {
      final dating = jsonDecode(response.body) as List;
      return dating.map((course) => Dating.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteDating(String id) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/courses/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete course.');
    }
  }

  Future<void> updateDating(Dating dating) async {
    final http.Response response = await httpClient.put(
      Uri.parse('$_baseUrl/courses/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': dating.username,
        'password': dating.password,
        
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update course.');
    }
  }
}