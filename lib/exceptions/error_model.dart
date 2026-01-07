class ErrorModel {
  final String responseCode;
  final String responseMessage;
  final String? data;

  const ErrorModel({
    required this.responseCode,
    required this.responseMessage,
    this.data,
  });

  factory ErrorModel.fromJson(Map<dynamic, dynamic> json) {
    if (json.containsKey("error_description")) {
      return ErrorModel(
        responseCode: json['error']?.toString() ?? "-",
        responseMessage: json['error_description']?.toString() ?? "-",
        data: "-",
      );
    }
    return ErrorModel(
      responseCode: json['responseCode']?.toString() ?? "-",
      responseMessage: json['responseMessage']?.toString() ?? "-",
      data: json['id']?.toString() ?? "-",
    );
  }

  factory ErrorModel.fromResponse(Map? object) {
    if (object is Map) {
      final json = object;
      if (json.containsKey("error_description")) {
        return ErrorModel(
          responseCode: json['error']?.toString() ?? "-",
          responseMessage: json['error_description']?.toString() ?? "-",
          data: "-",
        );
      }
    }
    return ErrorModel(
      responseCode: "-",
      responseMessage: "-",
      data: "-",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'responseCode': responseCode,
      'responseMessage': responseMessage,
      'id': data,
    };
  }

  List<Object?> get props => [responseCode, responseMessage, data];
}
