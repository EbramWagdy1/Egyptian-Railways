import 'package:egyptianrailways/core/utils/app_strings.dart';

enum MyTripsTab {
  upcoming(AppStrings.tripsUpcoming),
  past(AppStrings.tripsPast),
  cancelled(AppStrings.tripsCancelled);

  const MyTripsTab(this.label);

  final String label;
}

enum TripBookingStatus {
  pendingActivation,
  activated,
  completed,
  autoCancelled,
  cancelled,
}

class MyTripModel {
  const MyTripModel({
    required this.id,
    required this.fromStation,
    required this.toStation,
    required this.trainNumber,
    required this.dateLabel,
    required this.carNumber,
    required this.seatNumber,
    required this.status,
    this.departureTime,
    this.arrivalTime,
    this.rating,
    this.cancellationReason,
  });

  final String id;
  final String fromStation;
  final String toStation;
  final String trainNumber;
  final String dateLabel;
  final String? departureTime;
  final String? arrivalTime;
  final String carNumber;
  final String seatNumber;
  final TripBookingStatus status;
  final int? rating;
  final String? cancellationReason;

  MyTripModel copyWith({
    int? rating,
  }) {
    return MyTripModel(
      id: id,
      fromStation: fromStation,
      toStation: toStation,
      trainNumber: trainNumber,
      dateLabel: dateLabel,
      departureTime: departureTime,
      arrivalTime: arrivalTime,
      carNumber: carNumber,
      seatNumber: seatNumber,
      status: status,
      rating: rating ?? this.rating,
      cancellationReason: cancellationReason,
    );
  }
}

class ReturnTripSuggestionModel {
  const ReturnTripSuggestionModel({
    required this.fromStation,
    required this.toStation,
    required this.dateLabel,
    required this.suggestedDate,
  });

  final String fromStation;
  final String toStation;
  final String dateLabel;
  final DateTime suggestedDate;
}
