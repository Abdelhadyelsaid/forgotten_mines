import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forgotten_mines/Controller/Const/api_url.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    debugPrint('dio helper run');
    dio = Dio(BaseOptions(
      validateStatus: (_) => true,
      baseUrl: ApiUrl.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers={
      "Access-Control-Allow-Origin": "*"
    };
    return await dio!
        .get(
      url,
      queryParameters: query,
      options: Options(
          contentType: Headers.jsonContentType,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    )
        .catchError((error) {
      print(error.toString());
    });
  }
}
