import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ResultsDaysSelector extends StatelessWidget {
  const ResultsDaysSelector({
    super.key,
    required this.days,
    required this.selectedDate,
    required this.onDaySelected,
  });

  final List<DateTime> days;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDaySelected;

  static const List<String> _shortWeekdays = [
    'إثنين',
    'ثلاثاء',
    'أربعاء',
    'خميس',
    'جمعة',
    'سبت',
    'أحد',
  ];

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < days.length; i++) ...[
          Expanded(
            child: _DayChip(
              weekday: _shortWeekdays[days[i].weekday - 1],
              dayNumber: '${days[i].day}',
              isSelected: _isSameDay(days[i], selectedDate),
              onTap: () => onDaySelected(days[i]),
            ),
          ),
          if (i < days.length - 1) const SizedBox(width: 16),
        ],
      ],
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.weekday,
    required this.dayNumber,
    required this.isSelected,
    required this.onTap,
  });

  final String weekday;
  final String dayNumber;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.ink : AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              weekday,
              style: AppTextStyle.tiny.copyWith(
                color: isSelected
                    ? AppColors.textOnDarkMuted
                    : AppColors.textMuted,
              ),
            ),
            Text(
              dayNumber,
              style: AppTextStyle.button.copyWith(
                color: isSelected ? AppColors.textOnDark : AppColors.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
