import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/results/model/train_result_model.dart';
import 'package:flutter/material.dart';

class ResultsFilterChips extends StatelessWidget {
  const ResultsFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final TrainFilter selectedFilter;
  final ValueChanged<TrainFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < TrainFilter.values.length; i++) ...[
            _FilterChip(
              label: TrainFilter.values[i].label,
              isSelected: selectedFilter == TrainFilter.values[i],
              onTap: () => onFilterChanged(TrainFilter.values[i]),
            ),
            if (i < TrainFilter.values.length - 1) const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.ink : AppColors.card,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text(
          label,
          style: AppTextStyle.caption.copyWith(
            color: isSelected ? AppColors.textOnDark : AppColors.ink,
          ),
        ),
      ),
    );
  }
}
