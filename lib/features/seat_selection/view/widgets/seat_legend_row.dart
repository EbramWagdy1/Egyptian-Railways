import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SeatLegendRow extends StatelessWidget {
  const SeatLegendRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _LegendItem(
            label: 'متاح',
            color: AppColors.card,
            borderColor: AppColors.line,
            textColor: AppColors.textMuted,
          ),
          _LegendItem(
            label: 'مختارك',
            color: AppColors.primary,
            textColor: AppColors.primary,
          ),
          _LegendItem(
            label: 'محجوز',
            color: AppColors.line,
            textColor: AppColors.textMuted,
          ),
          _LegendItem(
            label: 'شباك',
            color: AppColors.sky,
            borderColor: AppColors.line,
            textColor: Color(0xFF3E6FA8),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.label,
    required this.color,
    required this.textColor,
    this.borderColor,
  });

  final String label;
  final Color color;
  final Color textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: borderColor != null ? Border.all(color: borderColor!) : null,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: AppTextStyle.micro.copyWith(color: textColor),
        ),
      ],
    );
  }
}
