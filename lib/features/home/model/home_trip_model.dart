class BookedTripModel {
  const BookedTripModel({
    required this.trainNumber,
    required this.statusLabel,
    required this.departureTime,
    required this.arrivalTime,
    required this.fromStation,
    required this.platform,
    required this.toStation,
    required this.carNumber,
    required this.seatNumber,
    required this.startsIn,
  });

  final String trainNumber;
  final String statusLabel;
  final String departureTime;
  final String arrivalTime;
  final String fromStation;
  final String platform;
  final String toStation;
  final String carNumber;
  final String seatNumber;
  final String startsIn;
}

class SelectDateArgs {
  const SelectDateArgs({
    required this.fromStation,
    required this.toStation,
    required this.isRoundTrip,
    this.initialDeparture,
    this.initialReturn,
  });

  final String fromStation;
  final String toStation;
  final bool isRoundTrip;
  final DateTime? initialDeparture;
  final DateTime? initialReturn;
}

class SelectedDateResult {
  const SelectedDateResult({
    required this.departureDate,
    this.returnDate,
  });

  final DateTime departureDate;
  final DateTime? returnDate;
}

class FrequentRouteModel {
  const FrequentRouteModel({
    required this.fromStation,
    required this.toStation,
    required this.schedule,
  });

  final String fromStation;
  final String toStation;
  final String schedule;
}
