import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class RateTripStarsCard extends StatelessWidget {
  const RateTripStarsCard({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  final int rating;
  final ValueChanged<int> onRatingChanged;

  String get _ratingLabel {
    switch (rating) {
      case 1:
        return AppStrings.ratingVeryBad;
      case 2:
        return AppStrings.ratingAcceptable;
      case 3:
        return AppStrings.ratingGood;
      case 4:
        return AppStrings.ratingVeryGood;
      case 5:
        return AppStrings.ratingExcellent;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            AppStrings.howWasTrip,
            style: AppTextStyle.h4,
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starValue = index + 1;
              final isSelected = starValue <= rating;
              return GestureDetector(
                onTap: () => onRatingChanged(starValue),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Icon(
                    Icons.star_rounded,
                    size: 42,
                    color: isSelected ? AppColors.warning : AppColors.line,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          Text(
            _ratingLabel,
            style: AppTextStyle.smallSemiBold.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
