import 'package:flutter/material.dart';
import 'package:tabra3/config/routes/routes.dart';
import 'package:tabra3/core/functions/navigation.dart';

import '../../../../../core/utils/app_strings.dart';

class HaveAccountButton extends StatelessWidget {
  const HaveAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.haveAccount),
        TextButton(
          onPressed: () => navigateAndRemove(context, Routes.login),
          child: const Text(
            AppStrings.login,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
