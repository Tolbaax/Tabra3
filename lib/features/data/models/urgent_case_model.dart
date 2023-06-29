class UrgentCaseModel {
  String? message;
  int? code;
  List<UrgentCase>? result;

  UrgentCaseModel({this.message, this.code, this.result});

  UrgentCaseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    if (json['result'] != null) {
      result = <UrgentCase>[];
      json['result'].forEach((v) {
        result!.add(UrgentCase.fromJson(v));
      });
    }
  }
}

class UrgentCase {
  int? id;
  String? name;
  int? age;
  String? gender;
  String? bloodType;
  String? phoneNumber;
  String? city;
  int? bloodBags;

  UrgentCase({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.bloodType,
    this.phoneNumber,
    this.city,
    this.bloodBags,
  });

  UrgentCase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    bloodType = json['bloodType'];
    city = json['city'];
    bloodBags = json['bloodBags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['bloodType'] = this.bloodType;
    data['city'] = this.city;
    data['bloodBags'] = this.bloodBags;
    return data;
  }
}
