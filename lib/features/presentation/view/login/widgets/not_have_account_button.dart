import 'package:flutter/material.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../../core/utils/app_strings.dart';

class NotHaveAccountButton extends StatelessWidget {
  const NotHaveAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.dontHaveAccount),
        TextButton(
          onPressed: () => navigateTo(context, Routes.register),
          child: const Text(
            AppStrings.signUp,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
