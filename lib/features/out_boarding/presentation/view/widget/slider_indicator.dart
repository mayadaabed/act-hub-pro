import 'package:flutter/material.dart';

import '../../../../../config/constants.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';

class SilderIndicator extends StatelessWidget {
  const SilderIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w65),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ManagerRadius.r12),
            color: ManagerColors.greyLight),
        width: double.infinity,
        height: ManagerHeight.h4,
        child: Row(
          children: [
            ...List.generate(
              3,
              (index) => Expanded(
                child: AnimatedContainer(
                  duration:
                      const Duration(seconds: Constants.outBoardingDuration),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    color: index == 0
                        ? ManagerColors.primaryColor
                        : ManagerColors.greyLight,
                    borderRadius: BorderRadius.circular(ManagerRadius.r12),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
