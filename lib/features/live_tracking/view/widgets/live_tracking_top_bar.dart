import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class LiveTrackingTopBar extends StatelessWidget {
  const LiveTrackingTopBar({
    super.key,
    required this.trainNumber,
    required this.statusLabel,
    required this.isOnTime,
  });

  final String trainNumber;
  final String statusLabel;
  final bool isOnTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.trackTrainNumber(trainNumber),
            style: AppTextStyle.h3,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isOnTime ? AppColors.successBg : AppColors.warningBg,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              statusLabel,
              style: AppTextStyle.badge.copyWith(
                color: isOnTime ? AppColors.success : AppColors.warningText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
