import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String desc;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.desc,
  });
}

List<OnBoardingModel> getOnBoardingData(BuildContext context) {
  return [
    OnBoardingModel(
      image: AppAssets.onboarding1,
      title: AppStrings.onboardingTitle1,
      desc: AppStrings.onboardingBody1,
    ),
    OnBoardingModel(
      image: AppAssets.onboarding2,
      title: AppStrings.onboardingTitle2,
      desc: AppStrings.onboardingBody2,
    ),
    OnBoardingModel(
      image: AppAssets.onboarding3,
      title: AppStrings.onboardingTitle3,
      desc: AppStrings.onboardingBody3,
    ),
  ];
}
