import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';

class CustomSegmentedButton extends StatefulWidget {
  const CustomSegmentedButton({Key? key}) : super(key: key);

  @override
  State<CustomSegmentedButton> createState() => _CustomSegmentedButtonState();
}

class _CustomSegmentedButtonState extends State<CustomSegmentedButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) => GestureDetector(
          onTap: () => setState(() {
            var selectedIndex = index;
          }),
          child: Container(
            height: context.height * 0.044,
            width: context.width * 0.43,
            decoration: BoxDecoration(
                color: index == 0 ? AppColors.primary.withOpacity(0.6) : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(index == 0 ? 10 : 0),
                  bottomLeft: Radius.circular(index == 0 ? 0 : 10),
                  topRight: Radius.circular(index == 0 ? 10 : 0),
                  topLeft: Radius.circular(index == 0 ? 0 : 10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.hint,
                    blurRadius: 0.1,
                  ),
                ]),
            child: Center(
              child: Text(
                index == 0 ? AppStrings.donateNow : AppStrings.showMap,
                style: TextStyle(
                  color: index == 0 ? Colors.white : Colors.black,
                  fontSize: 16.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
