// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'api_header.dart';

class DioClient {
  static const int TIME_OUT_DURATION = 2000;
  BaseOptions baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: TIME_OUT_DURATION),
    receiveTimeout: const Duration(seconds: TIME_OUT_DURATION),
    sendTimeout: const Duration(seconds: TIME_OUT_DURATION),
  );

  //GET
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      var response =
          await Dio(baseOptions).get(url, options: Options(headers: Header.defaultHeader), queryParameters: params);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
