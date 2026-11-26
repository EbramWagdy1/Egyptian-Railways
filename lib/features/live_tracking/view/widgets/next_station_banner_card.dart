import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class NextStationBannerCard extends StatelessWidget {
  const NextStationBannerCard({
    super.key,
    required this.stationName,
    required this.arrivalTime,
    required this.etaLabel,
  });

  final String stationName;
  final String arrivalTime;
  final String etaLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.nextStation,
                style: AppTextStyle.caption.copyWith(
                  color: AppColors.textOnDarkMuted,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stationName,
                style: AppTextStyle.bodyBold.copyWith(
                  fontSize: 20,
                  color: AppColors.textOnDark,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                arrivalTime,
                style: AppTextStyle.time.copyWith(
                  color: AppColors.textOnDark,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                etaLabel,
                style: AppTextStyle.caption.copyWith(
                  color: AppColors.textOnDarkMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
