import 'package:egyptianrailways/app/app.dart';
import 'package:egyptianrailways/core/database/cache/cache_helper.dart';
import 'package:egyptianrailways/core/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}
