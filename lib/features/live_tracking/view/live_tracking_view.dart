import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/features/live_tracking/data/live_tracking_dummy_data.dart';
import 'package:egyptianrailways/features/live_tracking/model/live_tracking_model.dart';
import 'package:egyptianrailways/features/live_tracking/view/widgets/live_tracking_top_bar.dart';
import 'package:egyptianrailways/features/live_tracking/view/widgets/next_station_banner_card.dart';
import 'package:egyptianrailways/features/live_tracking/view/widgets/route_stations_timeline_card.dart';
import 'package:egyptianrailways/features/live_tracking/view/widgets/train_speed_share_card.dart';
import 'package:egyptianrailways/features/live_tracking/view/widgets/trip_progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LiveTrackingView extends StatelessWidget {
  const LiveTrackingView({
    super.key,
    this.tracking = LiveTrackingDummyData.sampleTracking,
  });

  final LiveTrackingModel tracking;

  Future<void> _shareTrip(BuildContext context) async {
    final summary =
        '${AppStrings.trackTrainNumber(tracking.trainNumber)} · '
        '${AppStrings.nextStation}: ${tracking.nextStationName} (${tracking.nextStationTime}) · '
        '${AppStrings.expectedArrival}: ${tracking.expectedArrivalTime}';
    await Clipboard.setData(ClipboardData(text: summary));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.tripShareCopied),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LiveTrackingTopBar(
                trainNumber: tracking.trainNumber,
                statusLabel: tracking.statusLabel,
                isOnTime: tracking.isOnTime,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      NextStationBannerCard(
                        stationName: tracking.nextStationName,
                        arrivalTime: tracking.nextStationTime,
                        etaLabel: tracking.nextStationEta,
                      ),
                      const SizedBox(height: 12),
                      TripProgressCard(
                        progress: tracking.progress,
                        remainingDistance: tracking.remainingDistanceLabel,
                        expectedArrival: tracking.expectedArrivalTime,
                      ),
                      const SizedBox(height: 12),
                      RouteStationsTimelineCard(
                        stations: tracking.stations,
                      ),
                      const SizedBox(height: 12),
                      TrainSpeedShareCard(
                        currentSpeed: tracking.currentSpeedLabel,
                        onShareTap: () => _shareTrip(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
