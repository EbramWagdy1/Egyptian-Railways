import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/live_tracking/model/live_tracking_model.dart';
import 'package:flutter/material.dart';

class RouteStationsTimelineCard extends StatelessWidget {
  const RouteStationsTimelineCard({
    super.key,
    required this.stations,
  });

  final List<TrackingStationModel> stations;

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
        children: [
          for (int i = 0; i < stations.length; i++) ...[
            _StationTimelineRow(station: stations[i]),
            if (i < stations.length - 1) const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}

class _StationTimelineRow extends StatelessWidget {
  const _StationTimelineRow({
    required this.station,
  });

  final TrackingStationModel station;

  @override
  Widget build(BuildContext context) {
    final isCurrent = station.status == TrackingStationStatus.current;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: Center(
                child: _StatusDot(status: station.status),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              station.name,
              style: isCurrent
                  ? AppTextStyle.bodyBold
                  : AppTextStyle.bodySemiBold,
            ),
          ],
        ),
        Text(
          station.timeLabel,
          style: AppTextStyle.caption,
        ),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({required this.status});

  final TrackingStationStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case TrackingStationStatus.passed:
        return Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
        );
      case TrackingStationStatus.current:
        return Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: AppColors.errorBg,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        );
      case TrackingStationStatus.upcoming:
        return Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: AppColors.line,
            shape: BoxShape.circle,
          ),
        );
    }
  }
}
