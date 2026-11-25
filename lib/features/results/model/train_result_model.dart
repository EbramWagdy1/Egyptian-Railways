enum TrainStatus {
  onTime,
  delayed,
  full,
}

enum TrainFilter {
  all('الكل'),
  fastest('الأسرع'),
  firstClass('أولى'),
  ac('مكيف');

  const TrainFilter(this.label);

  final String label;
}

class ResultsArgs {
  const ResultsArgs({
    required this.fromStation,
    required this.toStation,
    required this.departureDate,
    this.returnDate,
    this.isRoundTrip = false,
  });

  final String fromStation;
  final String toStation;
  final DateTime departureDate;
  final DateTime? returnDate;
  final bool isRoundTrip;
}

class TrainResultModel {
  const TrainResultModel({
    required this.trainNumber,
    required this.title,
    required this.status,
    required this.statusLabel,
    this.departureTime = '',
    this.arrivalTime = '',
    this.durationAndClass = '',
    this.durationMinutes = 0,
    this.seatsLeftLabel,
    this.isFirstClass = false,
    this.isAc = false,
    this.isFull = false,
  });

  final String trainNumber;
  final String title;
  final TrainStatus status;
  final String statusLabel;
  final String departureTime;
  final String arrivalTime;
  final String durationAndClass;
  final int durationMinutes;
  final String? seatsLeftLabel;
  final bool isFirstClass;
  final bool isAc;
  final bool isFull;
}
