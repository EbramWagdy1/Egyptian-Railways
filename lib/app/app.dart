
import 'package:egyptianrailways/core/routing/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'سكة حديد مصر',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
