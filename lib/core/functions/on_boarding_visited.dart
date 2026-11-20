import 'package:egyptianrailways/core/database/cache/cache_helper.dart';
import 'package:egyptianrailways/core/services/service_locator.dart';

void onboardingvisit() {
  getIt<CacheHelper>().saveData(key: 'isFirstTime', value: true);
}
