import 'app_exceptions.dart';

///
/// @date: 2021/12/20 14:39
/// @author: kevin
/// @description: dart
class ApiResponse<T> implements Exception {
  Status status;
  T? data;
  String? code;
  String? message;
  AppException? exception;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.exception) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $exception \n Data : $data";
  }
}

enum Status { completed, error }
