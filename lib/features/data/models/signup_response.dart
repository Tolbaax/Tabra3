class SignUpResponse {
  final String? message;
  final int? code;
  final dynamic result;

  SignUpResponse({this.message, this.code, this.result});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      message: json['message'],
      code: json['code'],
      result: json['result'],
    );
  }
}
