import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TripAlertsCard extends StatelessWidget {
  const TripAlertsCard({
    super.key,
    required this.tripAlertsEnabled,
    required this.onTripAlertsChanged,
    required this.oneHourReminderEnabled,
    required this.onOneHourReminderChanged,
    required this.seatAvailableAlertEnabled,
    required this.onSeatAvailableAlertChanged,
  });

  final bool tripAlertsEnabled;
  final ValueChanged<bool> onTripAlertsChanged;
  final bool oneHourReminderEnabled;
  final ValueChanged<bool> onOneHourReminderChanged;
  final bool seatAvailableAlertEnabled;
  final ValueChanged<bool> onSeatAvailableAlertChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
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
        children: [
          _AlertToggleRow(
            label: AppStrings.tripAlerts,
            value: tripAlertsEnabled,
            onChanged: onTripAlertsChanged,
          ),
          const Divider(height: 1, thickness: 1, color: AppColors.line),
          _AlertToggleRow(
            label: AppStrings.remindBeforeTripHour,
            value: oneHourReminderEnabled,
            onChanged: onOneHourReminderChanged,
          ),
          const Divider(height: 1, thickness: 1, color: AppColors.line),
          _AlertToggleRow(
            label: AppStrings.notifyWhenSeatAvailable,
            value: seatAvailableAlertEnabled,
            onChanged: onSeatAvailableAlertChanged,
          ),
        ],
      ),
    );
  }
}

class _AlertToggleRow extends StatelessWidget {
  const _AlertToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyle.bodySemiBold,
            ),
            _PillSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class _PillSwitch extends StatelessWidget {
  const _PillSwitch({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 44,
        height: 24,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: value ? AppColors.success : AppColors.line,
          borderRadius: BorderRadius.circular(99),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 180),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.card,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
