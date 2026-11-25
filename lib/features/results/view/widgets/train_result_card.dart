import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/results/model/train_result_model.dart';
import 'package:flutter/material.dart';

class TrainResultCard extends StatelessWidget {
  const TrainResultCard({
    super.key,
    required this.train,
    this.isNotified = false,
    this.onTap,
    this.onNotifyTap,
  });

  final TrainResultModel train;
  final bool isNotified;
  final VoidCallback? onTap;
  final VoidCallback? onNotifyTap;

  Color get _badgeBg {
    switch (train.status) {
      case TrainStatus.onTime:
        return AppColors.successBg;
      case TrainStatus.delayed:
        return AppColors.warningBg;
      case TrainStatus.full:
        return AppColors.errorBg;
    }
  }

  Color get _badgeTextColor {
    switch (train.status) {
      case TrainStatus.onTime:
        return AppColors.success;
      case TrainStatus.delayed:
        return AppColors.warningTextStrong;
      case TrainStatus.full:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (train.isFull) {
      return _FullTrainCard(
        train: train,
        badgeBg: _badgeBg,
        badgeTextColor: _badgeTextColor,
        isNotified: isNotified,
        onNotifyTap: onNotifyTap,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
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
                  _CardHeader(
                    title: train.title,
                    statusLabel: train.statusLabel,
                    badgeBg: _badgeBg,
                    badgeTextColor: _badgeTextColor,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        train.departureTime,
                        style: AppTextStyle.h2,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 2,
                          color: AppColors.line,
                        ),
                      ),
                      Text(
                        train.arrivalTime,
                        style: AppTextStyle.h2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 1.5,
                    color: AppColors.line,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        train.durationAndClass,
                        style: AppTextStyle.micro,
                      ),
                      Text(
                        'اختيار الكرسي ‹',
                        style: AppTextStyle.bodyBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  if (train.seatsLeftLabel != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      train.seatsLeftLabel!,
                      style: AppTextStyle.micro,
                    ),
                  ],
                ],
              ),
            ),
            Positioned(
              left: -8,
              top: 81,
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
              top: 81,
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

class _FullTrainCard extends StatelessWidget {
  const _FullTrainCard({
    required this.train,
    required this.badgeBg,
    required this.badgeTextColor,
    required this.isNotified,
    this.onNotifyTap,
  });

  final TrainResultModel train;
  final Color badgeBg;
  final Color badgeTextColor;
  final bool isNotified;
  final VoidCallback? onNotifyTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CardHeader(
            title: train.title,
            statusLabel: train.statusLabel,
            badgeBg: badgeBg,
            badgeTextColor: badgeTextColor,
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: onNotifyTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isNotified ? AppColors.successBg : AppColors.sky,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                isNotified ? 'تم تفعيل التنبيه ✓' : 'نبهني لو فضي مكان',
                style: AppTextStyle.smallBold.copyWith(
                  color: isNotified ? AppColors.success : AppColors.ink,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.title,
    required this.statusLabel,
    required this.badgeBg,
    required this.badgeTextColor,
  });

  final String title;
  final String statusLabel;
  final Color badgeBg;
  final Color badgeTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.smallBold,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: badgeBg,
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            statusLabel,
            style: AppTextStyle.badge.copyWith(color: badgeTextColor),
          ),
        ),
      ],
    );
  }
}
