import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

final Dio apiClient =
    Dio(
        BaseOptions(
          baseUrl: 'http://192.168.1.8:8001/api/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (e, handler) {
            debugPrint('error: ${e.message}');
            return handler.next(e);
          },
        ),
      );
