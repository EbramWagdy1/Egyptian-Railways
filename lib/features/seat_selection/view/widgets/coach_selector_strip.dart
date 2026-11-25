import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CoachSelectorStrip extends StatelessWidget {
  const CoachSelectorStrip({
    super.key,
    required this.coachCount,
    required this.selectedCoach,
    required this.onCoachSelected,
  });

  final int coachCount;
  final int selectedCoach;
  final ValueChanged<int> onCoachSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: coachCount,
        separatorBuilder: (_, _) => const SizedBox(width: 7),
        itemBuilder: (context, index) {
          final coach = index + 1;
          final isSelected = coach == selectedCoach;
          return GestureDetector(
            onTap: () => onCoachSelected(coach),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.ink : AppColors.card,
                borderRadius: BorderRadius.circular(99),
                border: isSelected ? null : Border.all(color: AppColors.line),
              ),
              alignment: Alignment.center,
              child: Text(
                'عربة $coach',
                style: AppTextStyle.caption.copyWith(
                  fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? AppColors.textOnDark : AppColors.ink,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
