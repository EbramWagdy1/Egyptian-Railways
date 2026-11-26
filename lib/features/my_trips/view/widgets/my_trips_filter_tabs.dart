import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/my_trips/model/my_trip_model.dart';
import 'package:flutter/material.dart';

class MyTripsFilterTabs extends StatelessWidget {
  const MyTripsFilterTabs({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  final MyTripsTab selectedTab;
  final ValueChanged<MyTripsTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < MyTripsTab.values.length; i++) ...[
          _FilterTabPill(
            label: MyTripsTab.values[i].label,
            isSelected: selectedTab == MyTripsTab.values[i],
            onTap: () => onTabChanged(MyTripsTab.values[i]),
          ),
          if (i < MyTripsTab.values.length - 1) const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class _FilterTabPill extends StatelessWidget {
  const _FilterTabPill({
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.ink : AppColors.card,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text(
          label,
          style: AppTextStyle.smallSemiBold.copyWith(
            color: isSelected ? AppColors.textOnDark : AppColors.ink,
          ),
        ),
      ),
    );
  }
}
