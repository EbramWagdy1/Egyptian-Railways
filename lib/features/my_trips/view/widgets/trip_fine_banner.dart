import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TripFineBanner extends StatelessWidget {
  const TripFineBanner({
    super.key,
    this.message = AppStrings.fineBanner,
    this.onTap,
  });

  final String message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.errorBg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          message,
          style: AppTextStyle.smallSemiBold.copyWith(
            color: AppColors.errorText,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
