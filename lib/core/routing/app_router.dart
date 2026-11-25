import 'package:egyptianrailways/core/routing/app_routes.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/widgets/main_shell_view.dart';
import 'package:egyptianrailways/features/auth/view/login_view.dart';
import 'package:egyptianrailways/features/home/data/home_dummy_data.dart';
import 'package:egyptianrailways/features/home/model/home_trip_model.dart';
import 'package:egyptianrailways/features/home/view/home_view.dart';
import 'package:egyptianrailways/features/home/view/select_date_view.dart';
import 'package:egyptianrailways/features/home/view/select_station_view.dart';
import 'package:egyptianrailways/features/onboarding/view/on_boarding_view.dart';
import 'package:egyptianrailways/features/splash/view/splach_view.dart';
import 'package:flutter/material.dart';
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
      GoRoute(
        path: AppRoutes.selectStation,
        builder: (context, state) => SelectStationView(
          selectedStation: state.extra as String?,
        ),
      ),
      GoRoute(
        path: AppRoutes.selectDate,
        builder: (context, state) => SelectDateView(
          args: state.extra as SelectDateArgs,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeView(
                  bookedTrip: HomeDummyData.sampleBookedTrip,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.trips,
                builder: (context, state) => const _TabPlaceholderView(
                  title: AppStrings.tabTrips,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.track,
                builder: (context, state) => const _TabPlaceholderView(
                  title: AppStrings.tabTrack,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.account,
                builder: (context, state) => const _TabPlaceholderView(
                  title: AppStrings.tabAccount,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class _TabPlaceholderView extends StatelessWidget {
  const _TabPlaceholderView({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
