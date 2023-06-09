class SignUpResponse {
  String? message;
  int? code;
  Null result;

  SignUpResponse({this.message, this.code, this.result});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    result = json['result'];
  }
}

