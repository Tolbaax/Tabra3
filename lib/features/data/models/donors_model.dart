import 'package:tabra3/core/utils/assets_manager.dart';

class DonorModel {
  final String image;
  final String donorName;
  final String phoneNumber;
  final String bloodType;
  final String gov;

  DonorModel({
    required this.image,
    required this.donorName,
    required this.phoneNumber,
    required this.bloodType,
    required this.gov,
  });
}

List<DonorModel> donors = [
  DonorModel(
    image: ImageAssets.person2,
    donorName: 'محمد طلبه',
    phoneNumber: '01273545783',
    bloodType: 'AB+',
    gov: 'الدقهلية',
  ),
  DonorModel(
    image: ImageAssets.person2,
    donorName: 'محمد طلبه',
    phoneNumber: '01273545783',
    bloodType: 'AB+',
    gov: 'الدقهلية',
  ),
  DonorModel(
    image: ImageAssets.person2,
    donorName: 'محمد طلبه',
    phoneNumber: '01273545783',
    bloodType: 'AB+',
    gov: 'الدقهلية',
  ),
  DonorModel(
    image: ImageAssets.person2,
    donorName: 'محمد طلبه',
    phoneNumber: '01273545783',
    bloodType: 'AB+',
    gov: 'الدقهلية',
  ),
];
