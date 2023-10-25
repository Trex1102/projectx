import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioClient {
  final String baseUrl;
  Dio? _dio;
  final List<Interceptor>? interceptors;

  DioClient(
    this.baseUrl,
    Dio dio, {
    this.interceptors,
  }) {
    _dio = dio;
    _dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(minutes: 1)
      ..options.receiveTimeout = const Duration(minutes: 1)
      ..httpClientAdapter
      ..options.headers = {
        // 'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': "Bearer " + "",
      };
    // if (interceptors?.isNotEmpty ?? false) {
    _dio!.interceptors.clear();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      const storage = FlutterSecureStorage();

      final String? token = await storage.read(key: "token");

      options.headers.addAll({
        // 'X-Requested-With': 'XMLHttpRequest',
        "Content-Type": "application/json; charset=UTF-8",
        'Authorization': token,
      });
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioException` object eg: return `dio.reject(DioException)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioException` object eg: return `dio.reject(DioException)`
    }, onError: (DioException e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    }));

    // dio.interceptors
    //     .add(InterceptorsWrapper(onRequest: (RequestOptions options,RequestInterceptorHandler interceptorHandler) async{
    //   SharedPreferences _preferences = await SharedPreferences.getInstance();

    //   // dio.interceptors.requestLock.lock();
    //   options.headers['Authorization'] =
    //       "Bearer " + _preferences.getString("token");
    //   // dio.interceptors.requestLock.unlock();

    //   return options; //continue
    //   // If you want to resolve the request with some custom data，
    //   // you can return a `Response` object or return `dio.resolve(data)`.
    //   // If you want to reject the request with a error message,
    //   // you can return a `DioException` object or return `dio.reject(errMsg)`
    // }, onResponse: (Response response, RequestInterceptorHandler interceptorHandler)  {
    //   // Do something with response data
    //   return response; // continue
    // }, onError: (DioException error, ErrorInterceptorHandler interceptorHandler) async {
    //   SharedPreferences _prefs = await SharedPreferences.getInstance();
    //   if (error.response?.statusCode == 401) {
    //     RequestOptions options = error.response.request;
    //     options.headers["Authorization"] =
    //         "Bearer " + _prefs.getString("token");

    //     return _dio.request(options.path, options: options);
    //   } else {
    //     return error;
    //   } //continue
    // }));
    // }
    if (kDebugMode) {
      _dio!.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: false,
        requestBody: true,
      ));
    }
  }

  Future<dynamic> get(
    String uri, {
    // Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.get(
        uri,
        // data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

/*
*     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
*
* */