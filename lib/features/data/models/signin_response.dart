class SignInResponse {
  String? message;
  int? code;
  UserModel? result;

  SignInResponse({this.message, this.code, this.result});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    result =
        json['result'] != null ? new UserModel.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? name;
  String? email;
  String? token;
  int? userId;
  String? role;
  bool? isFirstLogin;
  bool? isConfirmed;

  UserModel(
      {this.name,
      this.email,
      this.token,
      this.userId,
      this.role,
      this.isFirstLogin,
      this.isConfirmed});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    token = json['token'];
    userId = json['userId'];
    role = json['role'];
    isFirstLogin = json['isFirstLogin'];
    isConfirmed = json['isConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    data['userId'] = this.userId;
    data['role'] = this.role;
    data['isFirstLogin'] = this.isFirstLogin;
    data['isConfirmed'] = this.isConfirmed;
    return data;
  }
}
