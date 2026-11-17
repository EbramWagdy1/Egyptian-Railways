import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/splash/view/widget/splash_loader.dart';
import 'package:flutter/material.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.splashBackground,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          ),
          Align(
            alignment: const Alignment(0, -0.15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.logo,
                  width: 210,
                  height: 71,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 14),
                const Text(
                  AppStrings.appName,
                  style: AppTextStyle.splashTitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 54,
            child: SafeArea(
              top: false,
              child: SplashLoader(),
            ),
          ),
        ],
      ),
    );
  }
}

