import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/my_trips/model/my_trip_model.dart';
import 'package:flutter/material.dart';

class PastTripCard extends StatelessWidget {
  const PastTripCard({
    super.key,
    required this.trip,
    this.onRateTap,
  });

  final MyTripModel trip;
  final VoidCallback? onRateTap;

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
                '${trip.fromStation} ← ${trip.toStation}',
                style: AppTextStyle.bodyBold.copyWith(fontSize: 15),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.successBg,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  AppStrings.completed,
                  style: AppTextStyle.badge.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${AppStrings.trainNumber(trip.trainNumber)} · ${trip.dateLabel}',
            style: AppTextStyle.caption,
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, thickness: 1, color: AppColors.line),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.carAndSeat(trip.carNumber, trip.seatNumber),
                style: AppTextStyle.caption,
              ),
              if (trip.rating == null)
                GestureDetector(
                  onTap: onRateTap,
                  child: Text(
                    '${AppStrings.rateYourTrip} ‹',
                    style: AppTextStyle.smallBold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                )
              else
                Text(
                  AppStrings.ratedOutOf(trip.rating!),
                  style: AppTextStyle.caption,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
