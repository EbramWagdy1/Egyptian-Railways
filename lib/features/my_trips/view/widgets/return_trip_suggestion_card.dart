import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_button.dart';
import 'package:egyptianrailways/features/my_trips/model/my_trip_model.dart';
import 'package:flutter/material.dart';

class ReturnTripSuggestionCard extends StatelessWidget {
  const ReturnTripSuggestionCard({
    super.key,
    required this.suggestion,
    this.onBookReturnTap,
  });

  final ReturnTripSuggestionModel suggestion;
  final VoidCallback? onBookReturnTap;

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
              Text(
                '${suggestion.fromStation} ← ${suggestion.toStation}',
                style: AppTextStyle.bodyBold.copyWith(fontSize: 15),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warningBg,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  AppStrings.notBooked,
                  style: AppTextStyle.badge.copyWith(
                    color: AppColors.warningText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${AppStrings.suggestedReturnTrip} · ${suggestion.dateLabel}',
            style: AppTextStyle.caption,
          ),
          const SizedBox(height: 14),
          CustomButton(
            text: AppStrings.bookReturn,
            height: 44,
            borderRadius: 12,
            fontSize: 14,
            onPressed: onBookReturnTap,
          ),
        ],
      ),
    );
  }
}
