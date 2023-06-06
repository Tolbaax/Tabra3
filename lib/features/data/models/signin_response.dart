class SignInResponse {
  String? message;
  int? code;
  Null result;

  SignInResponse({this.message, this.code, this.result});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    result = json['result'];
  }
}
