import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/features/my_trips/model/my_trip_model.dart';

class MyTripsDummyData {
  MyTripsDummyData._();

  static const String sampleFineMessage = AppStrings.fineBanner;

  static const List<MyTripModel> upcomingTrips = [
    MyTripModel(
      id: '1',
      fromStation: 'أسيوط',
      toStation: 'القاهرة',
      trainNumber: '971',
      dateLabel: 'الجمعة 9 يونيو',
      departureTime: '07:05',
      arrivalTime: '13:05',
      carNumber: '5',
      seatNumber: '1',
      status: TripBookingStatus.pendingActivation,
    ),
  ];

  static final ReturnTripSuggestionModel suggestedReturnTrip =
      ReturnTripSuggestionModel(
    fromStation: 'القاهرة',
    toStation: 'أسيوط',
    dateLabel: 'السبت 10 يونيو',
    suggestedDate: DateTime.now().add(const Duration(days: 1)),
  );

  static const List<MyTripModel> pastTrips = [
    MyTripModel(
      id: '2',
      fromStation: 'القاهرة',
      toStation: 'أسيوط',
      trainNumber: '1005',
      dateLabel: 'الأحد 4 يونيو',
      carNumber: '2',
      seatNumber: '14',
      status: TripBookingStatus.completed,
      rating: null,
    ),
    MyTripModel(
      id: '3',
      fromStation: 'أسيوط',
      toStation: 'القاهرة',
      trainNumber: '971',
      dateLabel: 'الجمعة 2 يونيو',
      carNumber: '5',
      seatNumber: '1',
      status: TripBookingStatus.completed,
      rating: 4,
    ),
    MyTripModel(
      id: '4',
      fromStation: 'أسيوط',
      toStation: 'القاهرة',
      trainNumber: '989',
      dateLabel: 'الخميس 25 مايو',
      carNumber: '3',
      seatNumber: '8',
      status: TripBookingStatus.completed,
      rating: 5,
    ),
  ];

  static const List<MyTripModel> cancelledTrips = [
    MyTripModel(
      id: '5',
      fromStation: 'أسيوط',
      toStation: 'القاهرة',
      trainNumber: '971',
      dateLabel: 'الثلاثاء 30 مايو',
      carNumber: '4',
      seatNumber: '12',
      status: TripBookingStatus.autoCancelled,
      cancellationReason: AppStrings.fineDue,
    ),
  ];
}
