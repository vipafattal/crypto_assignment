import 'package:crypto_assignment/framework/utils/exceptions.dart';
import 'package:crypto_assignment/ui/common/resources/resources.dart';

class NetworkProcess<T> {
  final String message;
  final bool isCompleted;
  final bool isSuccessful;
  final bool isProcessing;
  final NetworkException? exception;
  final T? data;

  bool get hasError => exception != null;

  const NetworkProcess({
    required this.message,
    required this.isCompleted,
    required this.isSuccessful,
    this.isProcessing: false,
    required this.exception,
    this.data,
  });

  NetworkProcess<TR> transform<TR>({TR? data}) => NetworkProcess(
        message: this.message,
        isSuccessful: this.isSuccessful,
        isCompleted: this.isCompleted,
        isProcessing: this.isProcessing,
        exception: this.exception,
        data: data,
      );

  NetworkProcess copyWith({
    String? message,
    bool? isSuccessful,
    bool? isCompleted,
    bool? isProcessing,
    NetworkException? exception,
    T? data,
  }) =>
      NetworkProcess(
        message: message ?? this.message,
        isSuccessful: isSuccessful ?? this.isSuccessful,
        isCompleted: isCompleted ?? this.isCompleted,
        isProcessing: isProcessing ?? this.isProcessing,
        exception: exception ?? this.exception,
        data: data ?? this.data,
      );

  NetworkProcess.newProcess()
      : message = "",
        isCompleted = false,
        isSuccessful = false,
        isProcessing = false,
        data = null,
        exception = null;

  NetworkProcess.processing({String? msg})
      : message = msg ?? Resources.strings.wait,
        isCompleted = false,
        isSuccessful = false,
        isProcessing = true,
        data = null,
        exception = null;

  NetworkProcess.succeeded({String msg = "", dynamic newData})
      : message = msg,
        isCompleted = true,
        isSuccessful = true,
        isProcessing = false,
        data = newData,
        exception = null;

  NetworkProcess.failed(NetworkException exception)
      : message = "",
        isCompleted = true,
        isSuccessful = false,
        isProcessing = false,
        data = null,
        exception = exception;
}
