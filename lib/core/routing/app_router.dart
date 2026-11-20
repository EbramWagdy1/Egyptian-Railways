import 'package:egyptianrailways/core/routing/app_routes.dart';
import 'package:egyptianrailways/features/auth/view/login_view.dart';
import 'package:egyptianrailways/features/onboarding/view/on_boarding_view.dart';
import 'package:egyptianrailways/features/splash/view/splach_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplachView(),
      ),
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnBoardingview(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
    
    ],
  );
}
