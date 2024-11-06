import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  Failures({required this.errMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection Timeout With ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send Timeout With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive Timeout With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errMessage: 'badCertificate Timeout With ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            error.response!.statusCode!, error.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request To ApiServer Was Canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            errMessage: 'There Was An Error, Please Try Again!');
    }
  }

  factory ServerFailure.fromBadResponse(
      int statusCode, Map<String, dynamic> response) {
    if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your Request Was Not Found, Please Try Later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'There Is A Problem With Server, Please Try Later!');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else {
      return ServerFailure(errMessage: 'There Was An Error, Please Try Again!');
    }
  }
}
