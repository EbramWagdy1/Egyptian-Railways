import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/home/model/home_trip_model.dart';
import 'package:flutter/material.dart';

class NextTripTicketCard extends StatelessWidget {
  const NextTripTicketCard({
    super.key,
    required this.trip,
    this.onTap,
  });

  final BookedTripModel trip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.nextTrip(trip.trainNumber),
                        style: AppTextStyle.caption.copyWith(
                          color: AppColors.textOnDarkMuted,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.successBg,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          trip.statusLabel,
                          style: AppTextStyle.badge.copyWith(
                            color: AppColors.success,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        trip.departureTime,
                        style: AppTextStyle.h2.copyWith(
                          color: AppColors.textOnDark,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 2,
                          color: const Color(0xFF3A4F6C),
                        ),
                      ),
                      Text(
                        trip.arrivalTime,
                        style: AppTextStyle.h2.copyWith(
                          color: AppColors.textOnDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${trip.fromStation} · رصيف ${trip.platform}',
                        style: AppTextStyle.micro.copyWith(
                          color: AppColors.textOnDarkMuted,
                        ),
                      ),
                      Text(
                        trip.toStation,
                        style: AppTextStyle.micro.copyWith(
                          color: AppColors.textOnDarkMuted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 1.5,
                    color: const Color(0xFF3A4F6C),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.carAndSeat(
                          trip.carNumber,
                          trip.seatNumber,
                        ),
                        style: AppTextStyle.caption.copyWith(
                          color: AppColors.textOnDark,
                        ),
                      ),
                      Text(
                        AppStrings.startsIn(trip.startsIn),
                        style: AppTextStyle.captionBold.copyWith(
                          color: AppColors.textOnDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: -8,
              bottom: 33,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -8,
              bottom: 33,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
