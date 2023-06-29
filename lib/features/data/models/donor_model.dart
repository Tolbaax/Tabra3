class DonorModel {
  String? message;
  int? code;
  List<Donor>? result;

  DonorModel({this.message, this.code, this.result});

  DonorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    if (json['result'] != null) {
      result = <Donor>[];
      json['result'].forEach((v) {
        result!.add(new Donor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Donor {
  int? id;
  String? name;
  int? age;
  String? gender;
  String? bloodType;
  String? city;
  bool? isActive;
  bool? isDeleted;
  String? creationDate;
  String? modifiedDate;
  String? phoneNumber;

  Donor(
      {this.id,
        this.name,
        this.age,
        this.gender,
        this.bloodType,
        this.city,
        this.isActive,
        this.isDeleted,
        this.creationDate,
        this.phoneNumber,
        this.modifiedDate});

  Donor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    bloodType = json['bloodType'];
    city = json['city'];
    isActive = json['isActive'];
    phoneNumber = json['phoneNumber'];
    isDeleted = json['isDeleted'];
    creationDate = json['creationDate'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['bloodType'] = this.bloodType;
    data['city'] = this.city;
    data['isActive'] = this.isActive;
    data['phoneNumber'] = this.phoneNumber;
    data['isDeleted'] = this.isDeleted;
    data['creationDate'] = this.creationDate;
    data['modifiedDate'] = this.modifiedDate;
    return data;
  }
}
