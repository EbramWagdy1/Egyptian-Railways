import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.model,
    required this.heroHeight,
  });

  final OnBoardingModel model;
  final double heroHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          child: Image.asset(
            model.image,
            width: double.infinity,
            height: heroHeight,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            model.title,
            style: const TextStyle(
              fontFamily: AppTextStyle.reemKufi,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            model.desc,
            style: const TextStyle(
              fontFamily: AppTextStyle.cairo,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textMuted,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}

