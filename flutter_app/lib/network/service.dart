import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';

class Net {
  final dio = Dio();
  Net(
      {required AuthorizationImpl impl,
      required BuildContext context,
      String? fingerprint}) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        impl.createHttp(client);
        return client;
      },
      validateCertificate: (certificate, host, port) {
        if (fingerprint != null) {
          // sha256.convert(certificate?.der).toString();
        }
        return true;
      },
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          return handler.next(error);
        },
        onRequest: (options, handler) async {
          var token = await impl.getAccessToken();
          if (token == null) {
            if (!context.mounted) return;
            token = await impl.authorize(context);
          }
          options.headers['Authorization'] = "Bearer $token";
          return handler.next(options);
        },
      ),
      // LogInterceptor(
      //   logPrint: (o) => debugPrint(o.toString()),
      // ),
    );
  }
  get(String path) {
    try {
      dio.post(
        path,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 406) throw HttpVersion("");
    }
  }
}

class HttpVersion extends HttpException {
  HttpVersion(super.message);
}

class Credentials extends AuthorizationImpl {
  Credentials({
    String? username,
  }) {}
  @override
  void createHttp(HttpClient client) {
    client.addCredentials(
        Uri.base, "realm", HttpClientBasicCredentials("", ""));
  }
}

abstract class AuthorizationImpl {
  void createHttp(HttpClient client) {}
  Future<String?>? getAccessToken() {}
  Future<String?>? authorize(BuildContext context) {}
}
