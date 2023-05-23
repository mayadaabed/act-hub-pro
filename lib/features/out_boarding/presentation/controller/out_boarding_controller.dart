import 'package:act_hub_project/config/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_strings.dart';
import '../view/widget/out_boarding_item.dart';

class OutBoardingController extends GetxController {
  late PageController pageController;
  static const firstPage = 0;
  static const lastPage = 2;
  int currentPage = firstPage;

  final List pageViewItems = [
    OutBoardingItem(
      image: ManagerAssets.outBoardingImage1,
      title: ManagerStrings.outBoardingTitle1,
      subTitle: ManagerStrings.outBoardingSubTitle1,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingImage2,
      title: ManagerStrings.outBoardingTitle2,
      subTitle: ManagerStrings.outBoardingSubTitle2,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingImage3,
      title: ManagerStrings.outBoardingTitle3,
      subTitle: ManagerStrings.outBoardingSubTitle3,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  setCurrentPage(int index) {
    currentPage = index;
    update();
  }

  void skipPage() {
    pageController.animateToPage(lastPage,
        duration: const Duration(seconds: Constants.outBoardingDuration),
        curve: Curves.fastLinearToSlowEaseIn);
    currentPage = lastPage;
    update();
  }

  void nextPage() {
    if (isLastPage()) {
      pageController.animateToPage(++currentPage,
          duration: const Duration(seconds: Constants.outBoardingDuration),
          curve: Curves.fastLinearToSlowEaseIn);
    }
    update();
  }

  bool isLastPage() {
    return currentPage < lastPage;
  }

  bool showBackButton() {
    return currentPage > firstPage && currentPage < lastPage;
  }
}
