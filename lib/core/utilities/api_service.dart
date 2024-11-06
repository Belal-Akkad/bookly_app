import 'package:dio/dio.dart';

class ApiService {
  ApiService({required this.dio});
  final Dio dio;
  final String baseUrl = 'https://www.googleapis.com/books/v1/';
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
