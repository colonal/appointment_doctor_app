import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/constants.dart';
import '../helpers/shared_pref_helper.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      _addDioHeaders();
      _addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static void _addDioHeaders() async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          "Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}",
    };
  }

  static Future<void> setTokenAfterLogin(String token) async {
    dio?.options.headers = {
      'Authorization': "Bearer $token",
    };
  }
}
