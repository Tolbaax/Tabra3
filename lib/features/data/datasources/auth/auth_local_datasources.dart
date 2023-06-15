import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_strings.dart';

abstract class AuthLocalDataSource {
  Future<void> setUserLoggedIn({String uid, String name, String email});

  Future<void> removeUser();

  String? getUser();

  String? getUserName();

  String? getUserEmail();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences preferences;

  AuthLocalDataSourceImpl({required this.preferences});

  @override
  Future<void> setUserLoggedIn(
      {String? uid, String? name, String? email}) async {
    await preferences.setString(AppStrings.uID, uid!);
    await preferences.setString(AppStrings.name, name!);
    await preferences.setString(AppStrings.email, email!);
  }

  @override
  Future<void> removeUser() async {
    await preferences.remove(AppStrings.uID);
    await preferences.remove(AppStrings.name);
    await preferences.remove(AppStrings.email);
  }

  @override
  String? getUser() => preferences.getString(AppStrings.uID);

  @override
  String? getUserName() => preferences.getString(AppStrings.name);

  @override
  String? getUserEmail() => preferences.getString(AppStrings.email);
}
