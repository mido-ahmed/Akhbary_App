import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        method: "GET",
      ),
    );
  }

  static Future<Response?> getData(
      {required String dataPath, required Map<String, dynamic> query}) async {
    return await dio?.get(dataPath, queryParameters: query);
  }
}
