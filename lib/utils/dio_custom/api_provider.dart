import 'package:adjemin_pay/utils/constant.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final String _baseUrl = Constant.rootUrl;
  Dio dio = Dio();
  ApiProvider() {
    dio.options.baseUrl = _baseUrl;
  }
}
