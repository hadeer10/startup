import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;
  static init() {
    //192.168.1.6
    dio = Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:8000',
      receiveDataWhenStatusError: true,
    ));
  }

  

  static Future<Response> postData(
      {@required String url,
      Map<String, dynamic> query,
      @required Map<String, dynamic> data,
      String lang = 'en',
      String token
      }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.post(url, queryParameters: query, data: data);
  }
  
  static Future<Response> getData(
      {@required String url,
      Map<String, dynamic> query,
     // String lang = 'en',
      String token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
     // 'lang': lang,
      'Authorization': token ?? ''
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> putData(
      {@required String url,
      Map<String, dynamic> query,
      @required Map<String, dynamic> data,
      String lang = 'ar',
      String token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.put(url, queryParameters: query, data: data);
  }

  static Future<Response> deleteData(
      {@required String url,
      String lang = 'en',
      String token,
      Map<String, dynamic> query}) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio.delete(url, queryParameters: query);
  }
}