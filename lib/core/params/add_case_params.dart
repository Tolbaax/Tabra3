import 'package:equatable/equatable.dart';

class AddCaseParams extends Equatable {
  final String name;
  final String age;
  final String gender;
  final String bloodType;
  final String city;
  final String bloodBags;
  final String PhoneNumber;

  const AddCaseParams({
    required this.name,
    required this.age,
    required this.gender,
    required this.bloodType,
    required this.city,
    required this.bloodBags,
    required this.PhoneNumber,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "bloodType": bloodType,
        "city": city,
        "bloodBags": bloodBags,
        "PhoneNumber": PhoneNumber,
      };

  @override
  List<Object?> get props => [
        name,
        age,
        gender,
        bloodType,
        city,
        bloodBags,
        PhoneNumber,
      ];
}
