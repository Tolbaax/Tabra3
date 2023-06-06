import 'package:flutter/material.dart';
import 'package:tabra3/core/functions/app_dialogs.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../widgets/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late bool isNotification = false;
  late bool donate = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfileHeader(),
                SizedBox(height: context.height * 0.08),
                SizedBox(
                  height: context.height * 0.062,
                  child: ListTile(
                    onTap: () {},
                    title: const Text(
                      'متاح للتبرع؟',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    splashColor: AppColors.primary,
                    trailing: Switch(
                      value: donate,
                      onChanged: (bool value) {
                        setState(() {
                          donate = !donate;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.062,
                  child: ListTile(
                    onTap: () {},
                    title: const Text(
                      'الاشعارات',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    splashColor: AppColors.primary,
                    trailing: Switch(
                      value: isNotification,
                      onChanged: (bool value) {
                        setState(() {
                          isNotification = !isNotification;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.062,
                  child: ListTile(
                    onTap: () {},
                    title: const Text(
                      'ادارة عنوانك',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    splashColor: AppColors.primary,
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.062,
                  child: ListTile(
                    onTap: () {},
                    title: const Text(
                      'السجل',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    splashColor: AppColors.primary,
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.062,
                  child: ListTile(
                    onTap: () {},
                    title: const Text(
                      'تفاصيل التواصل',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    splashColor: AppColors.primary,
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.062,
                  child: ListTile(
                    onTap: () => AppDialogs.showLogOutDialog(context),
                    title: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    splashColor: AppColors.primary,
                    trailing: const Icon(
                      Icons.login,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
