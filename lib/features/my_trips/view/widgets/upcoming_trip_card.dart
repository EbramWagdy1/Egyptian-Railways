import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/my_trips/model/my_trip_model.dart';
import 'package:flutter/material.dart';

class UpcomingTripCard extends StatelessWidget {
  const UpcomingTripCard({
    super.key,
    required this.trip,
    this.onViewTicketTap,
  });

  final MyTripModel trip;
  final VoidCallback? onViewTicketTap;

  @override
  Widget build(BuildContext context) {
    final isPending = trip.status == TripBookingStatus.pendingActivation;
    final badgeLabel =
        isPending ? AppStrings.pendingActivation : AppStrings.activated;
    final badgeBg = isPending ? AppColors.warningBg : AppColors.successBg;
    final badgeTextColor =
        isPending ? AppColors.warningText : AppColors.success;

    final timeRange =
        trip.departureTime != null && trip.arrivalTime != null
            ? ' · ${trip.departureTime} ← ${trip.arrivalTime}'
            : '';

    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
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
                          color: badgeBg,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          badgeLabel,
                          style: AppTextStyle.badge.copyWith(
                            color: badgeTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${trip.dateLabel}$timeRange',
                    style: AppTextStyle.caption,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: 16,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.line,
                    ),
                  ),
                  Positioned(
                    left: -8,
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
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'قطار ${trip.trainNumber} · ${AppStrings.carAndSeat(trip.carNumber, trip.seatNumber)}',
                    style: AppTextStyle.caption,
                  ),
                  GestureDetector(
                    onTap: onViewTicketTap,
                    child: Text(
                      '${AppStrings.viewTicket} ‹',
                      style: AppTextStyle.smallBold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
