import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TrainSpeedShareCard extends StatelessWidget {
  const TrainSpeedShareCard({
    super.key,
    required this.currentSpeed,
    this.onShareTap,
  });

  final String currentSpeed;
  final VoidCallback? onShareTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.currentSpeed,
                style: AppTextStyle.bodySemiBold,
              ),
              Text(
                currentSpeed,
                style: AppTextStyle.bodyBold,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Material(
            color: AppColors.sky,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onShareTap,
              child: SizedBox(
                height: 44,
                child: Center(
                  child: Text(
                    AppStrings.shareMyTrip,
                    style: AppTextStyle.buttonSecondary.copyWith(fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
