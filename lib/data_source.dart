import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static const String baseUrl = "https://antshackathon.pythonanywhere.com/";
  static init([String token = ""]) {
    const Duration duration = Duration(seconds: 5);
    dio = Dio(
      BaseOptions(
        sendTimeout: duration,
        receiveTimeout: duration,
        connectTimeout: duration,
        baseUrl: baseUrl,
        validateStatus: (status) {
          return status != null && status <= 500;
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }
}

Future<String> chatResponse(String question) async {
  var res = await DioHelper.dio.post('api/chat', data: {"question": question});
  return res.data;
}
