import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({
    super.key,
    this.onQuickBookTap,
    this.onTrackTrainTap,
    this.onStationsTap,
    this.onMyTicketsTap,
  });

  final VoidCallback? onQuickBookTap;
  final VoidCallback? onTrackTrainTap;
  final VoidCallback? onStationsTap;
  final VoidCallback? onMyTicketsTap;

  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickActionItem(
        label: AppStrings.quickBook,
        assetPath: AppAssets.iconBolt,
        onTap: onQuickBookTap,
      ),
      _QuickActionItem(
        label: AppStrings.trackTrain,
        assetPath: AppAssets.iconPin,
        onTap: onTrackTrainTap,
      ),
      _QuickActionItem(
        label: AppStrings.stations,
        assetPath: AppAssets.iconStation,
        onTap: onStationsTap,
      ),
      _QuickActionItem(
        label: AppStrings.myTicketsShort,
        assetPath: AppAssets.iconTicket,
        onTap: onMyTicketsTap,
      ),
    ];

    return Row(
      children: [
        for (int i = 0; i < actions.length; i++) ...[
          Expanded(child: actions[i]),
          if (i < actions.length - 1) const SizedBox(width: 9),
        ],
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  const _QuickActionItem({
    required this.label,
    required this.assetPath,
    this.onTap,
  });

  final String label;
  final String assetPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                assetPath,
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: AppTextStyle.micro.copyWith(color: AppColors.ink),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
