enum TrackingStationStatus {
  passed,
  current,
  upcoming,
}

class TrackingStationModel {
  const TrackingStationModel({
    required this.name,
    required this.timeLabel,
    required this.status,
  });

  final String name;
  final String timeLabel;
  final TrackingStationStatus status;
}

class LiveTrackingModel {
  const LiveTrackingModel({
    required this.trainNumber,
    required this.isOnTime,
    required this.statusLabel,
    required this.nextStationName,
    required this.nextStationTime,
    required this.nextStationEta,
    required this.progress,
    required this.remainingDistanceLabel,
    required this.expectedArrivalTime,
    required this.currentSpeedLabel,
    required this.stations,
  });

  final String trainNumber;
  final bool isOnTime;
  final String statusLabel;
  final String nextStationName;
  final String nextStationTime;
  final String nextStationEta;
  final double progress;
  final String remainingDistanceLabel;
  final String expectedArrivalTime;
  final String currentSpeedLabel;
  final List<TrackingStationModel> stations;
}
