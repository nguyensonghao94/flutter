import "package:dio/dio.dart";
import 'package:todo/constants/config.dart';
import 'package:todo/services/auth.dart';
import 'package:todo/services/user.dart';

class Client{
  Dio init() {
    Dio _dio = new Dio();
    _dio.interceptors.add(new ApiInterceptors());
    _dio.options.baseUrl = API_URL;
    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await AuthService().getToken();
    options.headers["Authorization"] = "Bearer ${token}";
    handler.next(options);
  }  

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != null && err.response?.statusCode == 403) {
      await UserService().logout();
      throw Exception("Token is expired. Please login now.");
    } else {
      String? message = err.response?.statusMessage;
      throw Exception(message);      
    }    
  }
}