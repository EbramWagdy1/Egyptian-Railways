import 'package:egyptianrailways/core/utils/app_strings.dart';

enum StationArea {
  all(AppStrings.areaAll),
  cairo(AppStrings.areaCairo),
  upperEgypt(AppStrings.areaUpperEgypt),
  delta(AppStrings.areaDelta);

  const StationArea(this.label);

  final String label;
}

class StationModel {
  const StationModel({
    required this.displayName,
    required this.shortName,
    required this.governorate,
    required this.area,
  });

  final String displayName;
  final String shortName;
  final String governorate;
  final StationArea area;
}
