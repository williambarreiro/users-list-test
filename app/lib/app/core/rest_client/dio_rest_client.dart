import 'package:dio/dio.dart';

import 'rest_client.dart';
import 'rest_client_exception.dart';

class DioRestClient implements RestClient {
  final Dio _client;

  DioRestClient(this._client);

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _client.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _client.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  Never _throwRestClientException(DioError dioError) {
    switch (dioError.response?.statusCode) {
      case 400:
        throw RestClientException.badRequest;
      case 403:
        throw RestClientException.forbidden;
      case 404:
        throw RestClientException.notFound;
      default:
        throw RestClientException.serverError;
    }
  }
}
