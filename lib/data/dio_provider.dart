import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/config.dart';

final dioProvider = Provider(
  (ref) {
    final config = ref.watch(configProvider);
    return Dio(
      BaseOptions(
        baseUrl: config.apiBaseUrl,
      ),
    );
  },
);
