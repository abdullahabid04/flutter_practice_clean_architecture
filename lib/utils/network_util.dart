import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:practice_clean_architecture/core/errors/exceptions/exceptions.dart';

class NetworkUtil {
  static final NetworkUtil _instance = NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = const JsonDecoder();
  final http.Client _client = http.Client();

  Future<dynamic> get(String url) async {
    try {
      return await _client.get(Uri.parse(url)).then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        if (statusCode == 200) {
          return _decoder.convert(res);
        } else {
          throw ServerException();
        }
      });
    } on SocketException catch (error) {
      throw ServerException();
    } on Exception catch (error) {
      throw GenericException();
    }
  }

  Future<dynamic> post(String url, {body}) async {
    try {
      return await _client
          .post(Uri.parse(url), body: body)
          .then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        if (statusCode == 200) {
          return _decoder.convert(res);
        } else {
          throw ServerException();
        }
      });
    } on SocketException catch (error) {
      throw ServerException();
    } on Exception catch (error) {
      throw GenericException();
    }
  }
}
