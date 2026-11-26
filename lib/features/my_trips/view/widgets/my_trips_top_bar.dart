import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_circle_icon_button.dart';
import 'package:flutter/material.dart';

class MyTripsTopBar extends StatelessWidget {
  const MyTripsTopBar({
    super.key,
    this.onSearchTap,
  });

  final VoidCallback? onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppStrings.myTrips,
            style: AppTextStyle.h3,
          ),
          CustomCircleIconButton(
            assetPath: AppAssets.iconSearch,
            backgroundColor: AppColors.sky,
            iconColor: AppColors.ink,
            onTap: onSearchTap,
          ),
        ],
      ),
    );
  }
}
