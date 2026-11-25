import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/features/results/model/train_result_model.dart';

class ResultsDummyData {
  ResultsDummyData._();

  static const List<TrainResultModel> trains = [
    TrainResultModel(
      trainNumber: '971',
      title: '971 · تحيا مصر',
      status: TrainStatus.onTime,
      statusLabel: AppStrings.onTime,
      departureTime: '07:05',
      arrivalTime: '13:05',
      durationAndClass: '6 س · تالتة مكيفة',
      durationMinutes: 360,
      seatsLeftLabel: 'متبقي 24 كرسي',
      isAc: true,
    ),
    TrainResultModel(
      trainNumber: '1005',
      title: '1005 · VIP',
      status: TrainStatus.delayed,
      statusLabel: 'متأخر 12 د',
      departureTime: '09:30',
      arrivalTime: '14:50',
      durationAndClass: '5 س 20 د · أولى',
      durationMinutes: 320,
      seatsLeftLabel: 'متبقي 3 كراسي',
      isFirstClass: true,
      isAc: true,
    ),
    TrainResultModel(
      trainNumber: '981',
      title: '981',
      status: TrainStatus.full,
      statusLabel: 'مكتمل',
      isFull: true,
    ),
    TrainResultModel(
      trainNumber: '989',
      title: '989 · مكيف',
      status: TrainStatus.onTime,
      statusLabel: AppStrings.onTime,
      departureTime: '13:20',
      arrivalTime: '19:40',
      durationAndClass: '6 س 20 د · تالتة',
      durationMinutes: 380,
      isAc: true,
    ),
  ];
}
