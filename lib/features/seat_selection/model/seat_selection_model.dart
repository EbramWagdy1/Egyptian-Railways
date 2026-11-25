import 'package:egyptianrailways/features/results/model/train_result_model.dart';

enum SeatStatus {
  available,
  window,
  booked,
}

class SeatModel {
  const SeatModel({
    required this.number,
    required this.status,
  });

  final int number;
  final SeatStatus status;

  bool get isBooked => status == SeatStatus.booked;
  bool get isWindow => status == SeatStatus.window;
}

class SeatSelectionArgs {
  const SeatSelectionArgs({
    required this.train,
    required this.fromStation,
    required this.toStation,
    required this.departureDate,
  });

  final TrainResultModel train;
  final String fromStation;
  final String toStation;
  final DateTime departureDate;
}
