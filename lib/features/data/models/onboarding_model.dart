import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/assets_manager.dart';

class OnBoardingModel {
  final String img;
  final String title1;
  final String title2;

  OnBoardingModel({
    required this.img,
    required this.title1,
    required this.title2,
  });
}

List<OnBoardingModel> onBoardings = [
  OnBoardingModel(
    img: ImageAssets.blood1,
    title1: AppStrings.boardingTitle1,
    title2: AppStrings.boardingDes1,
  ),
  OnBoardingModel(
    img: ImageAssets.blood2,
    title1: AppStrings.boardingTitle2,
    title2: AppStrings.boardingDes2,
  ),
  OnBoardingModel(
    img: ImageAssets.blood3,
    title1: AppStrings.boardingTitle3,
    title2: AppStrings.boardingDes3,
  ),
];
