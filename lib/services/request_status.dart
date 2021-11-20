class Success {
  int? code;
  Object? response;
  String? token;
  Success({this.code, this.response, this.token});
}

class Failure {
  int? code;
  Object? errorResponse;
  Failure({this.code, this.errorResponse});
}
