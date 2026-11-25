import 'package:egyptianrailways/features/home/model/home_trip_model.dart';
import 'package:egyptianrailways/features/home/model/station_model.dart';

class HomeDummyData {
  HomeDummyData._();

  static const BookedTripModel sampleBookedTrip = BookedTripModel(
    trainNumber: '971',
    statusLabel: 'في الميعاد',
    departureTime: '07:05',
    arrivalTime: '13:05',
    fromStation: 'أسيوط',
    platform: '3',
    toStation: 'القاهرة',
    carNumber: '5',
    seatNumber: '1',
    startsIn: '2 س 10 د',
  );

  static const List<FrequentRouteModel> frequentRoutes = [
    FrequentRouteModel(
      fromStation: 'أسيوط',
      toStation: 'القاهرة',
      schedule: 'كل جمعة · 07:05',
    ),
    FrequentRouteModel(
      fromStation: 'القاهرة',
      toStation: 'أسيوط',
      schedule: 'كل سبت · 14:50',
    ),
  ];

  static const List<StationModel> popularStations = [
    StationModel(
      displayName: 'القاهرة · رمسيس',
      shortName: 'القاهرة',
      governorate: 'القاهرة',
      area: StationArea.cairo,
    ),
    StationModel(
      displayName: 'الجيزة',
      shortName: 'الجيزة',
      governorate: 'الجيزة',
      area: StationArea.cairo,
    ),
    StationModel(
      displayName: 'الإسكندرية · مصر',
      shortName: 'الإسكندرية',
      governorate: 'الإسكندرية',
      area: StationArea.delta,
    ),
    StationModel(
      displayName: 'طنطا',
      shortName: 'طنطا',
      governorate: 'الغربية',
      area: StationArea.delta,
    ),
    StationModel(
      displayName: 'المنيا',
      shortName: 'المنيا',
      governorate: 'المنيا',
      area: StationArea.upperEgypt,
    ),
    StationModel(
      displayName: 'أسيوط',
      shortName: 'أسيوط',
      governorate: 'أسيوط',
      area: StationArea.upperEgypt,
    ),
    StationModel(
      displayName: 'سوهاج',
      shortName: 'سوهاج',
      governorate: 'سوهاج',
      area: StationArea.upperEgypt,
    ),
    StationModel(
      displayName: 'الأقصر',
      shortName: 'الأقصر',
      governorate: 'الأقصر',
      area: StationArea.upperEgypt,
    ),
  ];
}
