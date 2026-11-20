import 'package:egyptianrailways/core/functions/on_boarding_visited.dart';
import 'package:egyptianrailways/core/routing/app_routes.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_button.dart';
import 'package:egyptianrailways/features/onboarding/model/onboarding_model.dart';
import 'package:egyptianrailways/features/onboarding/view/widgets/custom_smooth_page.dart';
import 'package:egyptianrailways/features/onboarding/view/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingview extends StatefulWidget {
  const OnBoardingview({super.key});

  @override
  State<OnBoardingview> createState() => _OnBoardingviewState();
}

class _OnBoardingviewState extends State<OnBoardingview> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  void _onComplete() {
    onboardingvisit();
    context.go(AppRoutes.login);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = getOnBoardingData(context);
    final size = MediaQuery.of(context).size;
    final heroHeight = size.height * 0.58;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: data.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingItem(
                  model: data[index],
                  heroHeight: heroHeight,
                );
              },
            ),
          ),
          Customesmoothpageindicator(controller: _controller),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              text: _currentIndex == data.length - 1
                  ? AppStrings.start
                  : AppStrings.next,
              onPressed: () {
                if (_currentIndex < data.length - 1) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  _onComplete();
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 24,
            child: _currentIndex < data.length - 1
                ? GestureDetector(
                    onTap: _onComplete,
                    child: const Text(
                      AppStrings.skip,
                      style: TextStyle(
                        fontFamily: AppTextStyle.cairo,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textMuted,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
