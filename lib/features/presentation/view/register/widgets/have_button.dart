import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class HaveButton extends StatelessWidget {
  const HaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.haveAccount),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
