import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/home/model/home_trip_model.dart';
import 'package:flutter/material.dart';

class FrequentRoutesCard extends StatelessWidget {
  const FrequentRoutesCard({
    super.key,
    required this.routes,
    this.onViewAllTap,
    this.onRouteTap,
  });

  final List<FrequentRouteModel> routes;
  final VoidCallback? onViewAllTap;
  final ValueChanged<FrequentRouteModel>? onRouteTap;

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
                AppStrings.frequentTrips,
                style: AppTextStyle.bodyBold,
              ),
              GestureDetector(
                onTap: onViewAllTap,
                child: Text(
                  AppStrings.viewAll,
                  style: AppTextStyle.badge.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (int i = 0; i < routes.length; i++) ...[
            InkWell(
              onTap: onRouteTap != null ? () => onRouteTap!(routes[i]) : null,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${routes[i].fromStation} ← ${routes[i].toStation}',
                      style: AppTextStyle.smallSemiBold,
                    ),
                    Text(
                      routes[i].schedule,
                      style: AppTextStyle.micro.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (i < routes.length - 1) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}
