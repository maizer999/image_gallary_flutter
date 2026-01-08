import '../constant/app_strings.dart';
import 'error_model.dart';

enum IssueType {
  noInternetConnection,
  serverMaintenance,
  userNotSupported,
  userNotAuthorized,
}

class AppException implements Exception {
  final String message;
  final IssueType issueType;
  final Map? response;

  AppException({
    required this.message,
    required this.issueType,
    this.response,
  });

  @override
  String toString() => message;
}

// ------------- Specific Exceptions ---------------- //

class ConnectionIssueException extends AppException {
  ConnectionIssueException({Map? response})
      : super(
    message: AppStrings.noInternetConnectionMessage,
    issueType: IssueType.noInternetConnection,
    response: response,
  );
}

class AuthenticationFailedException extends AppException {
  AuthenticationFailedException({Map? response})
      : super(
    message: response?["error_description"] ?? 'Authentication failed',
    issueType: IssueType.userNotAuthorized,
    response: response,
  );
}

class InvalidRequestException extends AppException {
  InvalidRequestException({Map? response})
      : super(
    message: 'Invalid request, please check method, url, & parameters',
    issueType: IssueType.serverMaintenance,
    response: response,
  );
}

class MalformedOutputException extends AppException {
  MalformedOutputException({Map? response})
      : super(
    message: 'Malformed output from server',
    issueType: IssueType.serverMaintenance,
    response: response,
  );
}

class ServerErrorException extends AppException {
  ServerErrorException({Map? response})
      : super(
    message: response != null
        ? "${AppStrings.issueTypeEnumServerMaintenance} \n ${ErrorModel.fromResponse(response).responseMessage}"
        : AppStrings.internalServerError,
    issueType: IssueType.serverMaintenance,
    response: response,
  );
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException({Map? response})
      : super(
    message: response != null
        ? ErrorModel.fromResponse(response).responseMessage
        : 'Service Unavailable',
    issueType: IssueType.serverMaintenance,
    response: response,
  );
}

class NoDataFoundException extends AppException {
  NoDataFoundException({Map? response})
      : super(
    message: AppStrings.noDataFound,
    issueType: IssueType.serverMaintenance,
    response: response,
  );
}

class NotFoundException extends AppException {
  NotFoundException({Map? response})
      : super(
    message: AppStrings.notFound,
    issueType: IssueType.serverMaintenance,
    response: response,
  );
}

class UnknownErrorException extends AppException {
  UnknownErrorException({Map? response})
      : super(
    message: response != null
        ? ErrorModel.fromResponse(response).responseMessage
        : 'Undefined Error',
    issueType: IssueType.serverMaintenance,
    response: response,
  );
}

class FillAllFieldsException extends AppException {
  FillAllFieldsException()
      : super(
    message: 'Fill All Fields Exception',
    issueType: IssueType.serverMaintenance,
  );
}

class ErrorModelException extends AppException {
  final ErrorModel errorModel;

  ErrorModelException({required this.errorModel, Map? response})
      : super(
    message: errorModel.responseMessage,
    issueType: IssueType.serverMaintenance,
    response: response,
  );
}

class UserNotSupportedException extends AppException {
  UserNotSupportedException({Map? response})
      : super(
    message: 'User Not Supported',
    issueType: IssueType.userNotSupported,
    response: response,
  );
}

// ----------------- Exception Handler ----------------- //

class CommonExceptionHandler {
  static String getErrorMessage(AppException error) {
    return error.message.isNotEmpty ? error.message : AppStrings.undefined;
  }
}
