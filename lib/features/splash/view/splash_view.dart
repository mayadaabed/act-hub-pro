import 'package:act_hub_project/core/resources/manager_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/manager_sizes.dart';
import '../../../core/widgets/scaffold_with_background_image.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffoldWithBackgroundImage(child: Center(
          child: SvgPicture.asset(
        ManagerAssets.logo,
        width: ManagerWidth.w167,
      )),
    );
  }
}
