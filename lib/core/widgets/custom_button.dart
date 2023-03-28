import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTab;

  const CustomButton({Key? key, required this.text, this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
        ),
        onPressed: onTab,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
