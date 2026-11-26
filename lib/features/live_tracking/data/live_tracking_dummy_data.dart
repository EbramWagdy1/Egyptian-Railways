import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/features/live_tracking/model/live_tracking_model.dart';

class LiveTrackingDummyData {
  LiveTrackingDummyData._();

  static const LiveTrackingModel sampleTracking = LiveTrackingModel(
    trainNumber: '971',
    isOnTime: true,
    statusLabel: AppStrings.onTime,
    nextStationName: 'بني سويف',
    nextStationTime: '10:42',
    nextStationEta: 'بعد 18 دقيقة',
    progress: 0.62,
    remainingDistanceLabel: '71 كم',
    expectedArrivalTime: '13:05',
    currentSpeedLabel: '92 كم/س',
    stations: [
      TrackingStationModel(
        name: 'أسيوط',
        timeLabel: '07:05 · غادر',
        status: TrackingStationStatus.passed,
      ),
      TrackingStationModel(
        name: 'المنيا',
        timeLabel: '08:40 · غادر',
        status: TrackingStationStatus.passed,
      ),
      TrackingStationModel(
        name: 'بني سويف',
        timeLabel: '10:42 · رصيف 2',
        status: TrackingStationStatus.current,
      ),
      TrackingStationModel(
        name: 'الجيزة',
        timeLabel: '12:35',
        status: TrackingStationStatus.upcoming,
      ),
      TrackingStationModel(
        name: 'القاهرة',
        timeLabel: '13:05 · رصيف 6',
        status: TrackingStationStatus.upcoming,
      ),
    ],
  );
}
