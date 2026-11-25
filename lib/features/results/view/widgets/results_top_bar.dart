import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_circle_icon_button.dart';
import 'package:flutter/material.dart';

class ResultsTopBar extends StatelessWidget {
  const ResultsTopBar({
    super.key,
    required this.fromStation,
    required this.toStation,
    this.onBackTap,
    this.onFilterTap,
  });

  final String fromStation;
  final String toStation;
  final VoidCallback? onBackTap;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCircleIconButton(
                assetPath: AppAssets.iconBack,
                backgroundColor: AppColors.sky,
                iconColor: AppColors.ink,
                onTap: onBackTap,
              ),
              const SizedBox(width: 10),
              Text(
                '$fromStation ← $toStation',
                style: AppTextStyle.h3,
              ),
            ],
          ),
          CustomCircleIconButton(
            assetPath: AppAssets.iconSliders,
            backgroundColor: AppColors.sky,
            iconColor: AppColors.ink,
            onTap: onFilterTap,
          ),
        ],
      ),
    );
  }
}
