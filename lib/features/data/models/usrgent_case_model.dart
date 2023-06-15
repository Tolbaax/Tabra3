import 'package:tabra3/core/utils/assets_manager.dart';

class UrgentCaseModel {
  final String image;
  final String name;
  final String hospitalName;
  final String date;
  final String bloodType;
  final String phoneNumber;

  UrgentCaseModel({
    required this.image,
    required this.name,
    required this.hospitalName,
    required this.date,
    required this.bloodType,
    required this.phoneNumber,
  });
}

List<UrgentCaseModel> urgentCases = [
  UrgentCaseModel(
    image: ImageAssets.user,
    name: 'محمد طلبه',
    hospitalName: 'مستشفي المنزلة',
    date: '13/2/2023',
    bloodType: '+AB',
    phoneNumber: '01153548752',
  ),
  UrgentCaseModel(
    image: ImageAssets.user,
    name: 'احمد منصور',
    hospitalName: 'مستشفي الحياة',
    date: '15/3/2023',
    bloodType: '+B',
    phoneNumber: '01273548752',
  ),
  UrgentCaseModel(
    image: ImageAssets.user,
    name: 'محمد صلاح',
    hospitalName: 'مستشفي الاحا',
    date: '10/10/2023',
    bloodType: '-AB',
    phoneNumber: '01125548752',
  ),
  UrgentCaseModel(
    image: ImageAssets.user,
    name: 'ابو عبده',
    hospitalName: 'مستشفي الشيماء',
    date: '18/1/2023',
    bloodType: '+B',
    phoneNumber: '01273358752',
  ),
  UrgentCaseModel(
    image: ImageAssets.user,
    name: 'محمد طلبه',
    hospitalName: 'مستشفي المنزلة',
    date: '18/2/2020',
    bloodType: '+A',
    phoneNumber: '01245148752',
  ),
];
