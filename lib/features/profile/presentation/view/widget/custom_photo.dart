import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';

class CustomPhoto extends StatelessWidget {
  final bool visible;
  const CustomPhoto({
    Key? key,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: ManagerHeight.h110,
          decoration: BoxDecoration(
            color: ManagerColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(ManagerRadius.r20),
              bottomLeft: Radius.circular(ManagerRadius.r20),
            ),
          ),
        ),
        Visibility(
          visible: visible,
          child: Positioned(
            top: ManagerHeight.h80,
            child: CircleAvatar(
              radius: ManagerRadius.r50,
              backgroundImage: AssetImage(ManagerAssets.person),
            ),
          ),
        ),
      ],
    );
  }
}
