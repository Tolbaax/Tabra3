import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../error/exceptions.dart';
import '../services/injection_container.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';
import 'status_code.dart';

class DioConsumer extends ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    _configureClient();
  }

  void _configureClient() {
    _configureHttpClientAdapter();
    _addInterceptors();
    _configureOptions();
  }

  void _configureHttpClientAdapter() {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  void _addInterceptors() {
    client.interceptors.add(sl<AppInterceptor>());
    client.interceptors.add(sl<LogInterceptor>());
  }

  void _configureOptions() {
    client.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      responseType: ResponseType.plain,
      followRedirects: false,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (status) {
        return status! < StatusCode.internalServerError;
      },
    );
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.cancel:
        break;
      default:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
          case null:
            throw const NoInternetConnectionException();
        }
        break;
    }
  }
}
