import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Customesmoothpageindicator extends StatelessWidget {
  const Customesmoothpageindicator({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: const ExpandingDotsEffect(
        activeDotColor: AppColors.primary,
        dotColor: AppColors.line,
        dotWidth: 8,
        dotHeight: 8,
        expansionFactor: 2.75,
        spacing: 6,
      ),
    );
  }
}
