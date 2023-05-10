import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

String apiChuckNorris = 'https://api.chucknorris.io/jokes/random';

Future<List> consultData() async {
  Dio dio = Dio();

  List chuckList = [];

  for (var i = 0; i < 20; i++) {
    Response response = await dio.get(
      apiChuckNorris,
    );

    chuckList.add(response.data);
  }

  return chuckList;
}
