import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class RegisterUrgentCaseAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegisterUrgentCaseAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: const Text(
        AppStrings.registerUrgentCases,
        style: TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);
}
