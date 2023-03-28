import '../../utils/app_strings.dart';
import 'cache_helper.dart';

class CacheManager {
  static void cacheIsBoarding() {
    CacheHelper.saveData(
      key: AppStrings.isBoarding,
      value: AppStrings.isBoarding,
    );
  }
}
