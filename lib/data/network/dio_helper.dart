import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/constants.dart';


const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "Authorization";
const String defaultLanguage = "language";

class DioHelper {
  static Dio? dio;
  static Dio? newDio;
  static init() {
    Map<String, String> headers = {
      accept: applicationJson,
      authorization: "Bearer ${Constants.token}"
    };

    dio = Dio(BaseOptions(
        followRedirects: false,
        validateStatus: (state) => true,
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: const Duration(milliseconds: Constants.receiveTimeOut),
        sendTimeout: const Duration(milliseconds: Constants.receiveTimeOut)));
    if (!kReleaseMode) {
      dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    newDio = Dio(BaseOptions(
        followRedirects: false,
        validateStatus: (state) => true,
        baseUrl: "https://wash-stations.com/api/client/",
        headers: headers,
        receiveTimeout: const Duration(milliseconds: Constants.receiveTimeOut),
        sendTimeout: const Duration(milliseconds: Constants.receiveTimeOut)));
    if (!kReleaseMode) {
      newDio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }

  static Future<Response?> getData(
      {required String endPoint, Map<String, dynamic>? query}) async {
    return await dio?.get(endPoint, queryParameters: query);
  }
  static Future<Response?> getDataWithClientUrl(
      {required String endPoint, Map<String, dynamic>? query}) async {
    return await newDio?.get(endPoint, queryParameters: query);
  }
  static Future<Response?> updateData(
      {required String endPoint,
      required Map<String, dynamic> parameters}) async {
    return await dio?.put(endPoint, queryParameters: parameters);
  }

  static Future<Response?> postData(
      {required String endPoint, required Map<String, dynamic> data}) async {
    return await dio?.post(
      endPoint,
      data: data,
    );
  }

  static Future<Response?> postDataWithImage(
      {required String endPoint, FormData? data}) async {
    return await dio?.post(endPoint, data: data);
  }

  static Future<Response?> delete({required String endPoint}) async {
    return await dio?.delete(endPoint);
  }
}
