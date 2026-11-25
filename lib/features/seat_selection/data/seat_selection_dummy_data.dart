import 'package:egyptianrailways/features/seat_selection/model/seat_selection_model.dart';

class SeatSelectionDummyData {
  SeatSelectionDummyData._();

  static const int coachCount = 10;
  static const int seatsPerCoach = 85;
  static const String defaultPassengerName = 'إبرام سامي';

  /// Generates 85 seats for a given coach (1..10) with deterministic booked seats.
  static List<SeatModel> generateSeatsForCoach(int coachNumber) {
    return List.generate(seatsPerCoach, (index) {
      final seatNumber = index + 1;
      final isBooked = _isSeatBooked(coachNumber, seatNumber);
      if (isBooked) {
        return SeatModel(number: seatNumber, status: SeatStatus.booked);
      }
      final posInRow = index % 4;
      final isWindow = posInRow == 0 || posInRow == 3;
      return SeatModel(
        number: seatNumber,
        status: isWindow ? SeatStatus.window : SeatStatus.available,
      );
    });
  }

  static bool _isSeatBooked(int coach, int seat) {
    // Deterministic pattern so each of the 10 coaches has realistic availability
    final hash = (coach * 31 + seat * 17) % 11;
    return hash == 0 || hash == 3 || hash == 7;
  }
}
