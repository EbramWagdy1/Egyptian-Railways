import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_button.dart';
import 'package:egyptianrailways/core/widgets/custom_circle_icon_button.dart';
import 'package:flutter/material.dart';

class BookingSearchCard extends StatelessWidget {
  const BookingSearchCard({
    super.key,
    required this.fromStation,
    required this.toStation,
    required this.isRoundTrip,
    this.selectedDateLabel,
    this.onFromTap,
    this.onToTap,
    this.onSwapTap,
    this.onDateTap,
    this.onTripTypeChanged,
    this.onBookTap,
  });

  final String fromStation;
  final String toStation;
  final bool isRoundTrip;
  final String? selectedDateLabel;
  final VoidCallback? onFromTap;
  final VoidCallback? onToTap;
  final VoidCallback? onSwapTap;
  final VoidCallback? onDateTap;
  final ValueChanged<bool>? onTripTypeChanged;
  final VoidCallback? onBookTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.whereTo,
                style: AppTextStyle.bodyBold,
              ),
              Text(
                isRoundTrip ? AppStrings.roundTrip : AppStrings.oneWay,
                style: AppTextStyle.caption.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StationField(
                label: AppStrings.from,
                station: fromStation,
                alignment: CrossAxisAlignment.start,
                onTap: onFromTap,
              ),
              CustomCircleIconButton(
                assetPath: AppAssets.iconSwap,
                backgroundColor: AppColors.primary,
                iconColor: AppColors.textOnDark,
                onTap: onSwapTap,
              ),
              _StationField(
                label: AppStrings.to,
                station: toStation,
                alignment: CrossAxisAlignment.end,
                onTap: onToTap,
              ),
            ],
          ),
          const SizedBox(height: 18),
          InkWell(
            onTap: onDateTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: selectedDateLabel != null
                    ? AppColors.sky.withValues(alpha: 0.55)
                    : AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedDateLabel != null
                      ? AppColors.sky
                      : AppColors.line,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 17,
                        color: selectedDateLabel != null
                            ? AppColors.primary
                            : AppColors.textMuted,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        selectedDateLabel ?? 'التاريخ',
                        style: selectedDateLabel != null
                            ? AppTextStyle.smallBold
                            : AppTextStyle.smallSemiBold.copyWith(
                                color: AppColors.textMuted,
                              ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: AppColors.textMuted,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _TripTypeSegment(
                  label: AppStrings.oneWayOnly,
                  isSelected: !isRoundTrip,
                  onTap: () => onTripTypeChanged?.call(false),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _TripTypeSegment(
                  label: AppStrings.roundTrip,
                  isSelected: isRoundTrip,
                  onTap: () => onTripTypeChanged?.call(true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          CustomButton(
            text: AppStrings.bookTicket,
            height: 44,
            borderRadius: 12,
            fontSize: 13,
            onPressed: onBookTap,
          ),
        ],
      ),
    );
  }
}

class _StationField extends StatelessWidget {
  const _StationField({
    required this.label,
    required this.station,
    required this.alignment,
    this.onTap,
  });

  final String label;
  final String station;
  final CrossAxisAlignment alignment;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          crossAxisAlignment: alignment,
          children: [
            Text(
              label,
              style: AppTextStyle.micro.copyWith(color: AppColors.textMuted),
            ),
            const SizedBox(height: 2),
            Text(
              station,
              style: AppTextStyle.bodyBold,
            ),
          ],
        ),
      ),
    );
  }
}

class _TripTypeSegment extends StatelessWidget {
  const _TripTypeSegment({
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.card : const Color(0xFFDCDFE3),
          borderRadius: BorderRadius.circular(11),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: isSelected
              ? AppTextStyle.smallBold
              : AppTextStyle.smallSemiBold.copyWith(
                  color: AppColors.textMuted,
                ),
        ),
      ),
    );
  }
}
