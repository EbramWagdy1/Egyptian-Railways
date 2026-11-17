import 'package:flutter/material.dart';

import 'features/splash/view/splach_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'سكة حديد مصر',
      debugShowCheckedModeBanner: false,
      home: SplachView(),
    );
  }
}
