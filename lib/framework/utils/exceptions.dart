class NetworkException implements Exception {
  static const int DEFAULT_EXCEPTION = -1;
  final _message;
  final _prefix;

  NetworkException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

//400
class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

//401
class UnauthorisedException extends NetworkException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

//403
class ForbiddenException extends NetworkException {
  ForbiddenException([message]) : super(message, "Invalid Request: ");
}

//429
class TooManyRequestsException extends NetworkException {
  TooManyRequestsException([message]) : super(message, "Invalid Request: ");
}

NetworkException getErrorByCode(int statusCode) {
  NetworkException error;
  switch (statusCode) {
    case 400:
      error = BadRequestException();
      break;
    case 402:
      error = UnauthorisedException();
      break;
    case 403:
      error = ForbiddenException();
      break;
    case 429:
      error = TooManyRequestsException();
      break;
    default:
      error = FetchDataException();
  }
  return error;
}
