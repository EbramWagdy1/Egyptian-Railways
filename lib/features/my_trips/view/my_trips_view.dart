import 'package:egyptianrailways/core/routing/app_routes.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/my_trips/data/my_trips_dummy_data.dart';
import 'package:egyptianrailways/features/my_trips/model/my_trip_model.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/cancelled_trip_card.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/my_trips_filter_tabs.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/my_trips_top_bar.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/past_trip_card.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/return_trip_suggestion_card.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/trip_alerts_card.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/trip_fine_banner.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/upcoming_trip_card.dart';
import 'package:egyptianrailways/features/results/model/train_result_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyTripsView extends StatefulWidget {
  const MyTripsView({
    super.key,
    this.fineMessage,
  });

  /// Displayed only when the user has a due fine from backend.
  final String? fineMessage;

  @override
  State<MyTripsView> createState() => _MyTripsViewState();
}

class _MyTripsViewState extends State<MyTripsView> {
  MyTripsTab _selectedTab = MyTripsTab.upcoming;
  bool _isSearching = false;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  bool _tripAlertsEnabled = true;
  bool _oneHourReminderEnabled = true;
  bool _seatAvailableAlertEnabled = false;
  late List<MyTripModel> _pastTrips;

  @override
  void initState() {
    super.initState();
    _pastTrips = List<MyTripModel>.from(MyTripsDummyData.pastTrips);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _openRateTrip(MyTripModel trip) async {
    final rating = await context.push<int>(
      AppRoutes.rateTrip,
      extra: trip,
    );
    if (rating == null || !mounted) return;
    setState(() {
      _pastTrips = [
        for (final item in _pastTrips)
          item.id == trip.id ? item.copyWith(rating: rating) : item,
      ];
    });
  }

  bool _matchesSearch(MyTripModel trip) {
    final trimmed = _searchQuery.trim();
    if (trimmed.isEmpty) return true;
    return trip.fromStation.contains(trimmed) ||
        trip.toStation.contains(trimmed) ||
        trip.trainNumber.contains(trimmed) ||
        trip.dateLabel.contains(trimmed);
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchQuery = '';
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyTripsTopBar(onSearchTap: _toggleSearch),
              if (_isSearching)
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    style: AppTextStyle.body,
                    decoration: InputDecoration(
                      hintText: AppStrings.searchTripsHint,
                      hintStyle: AppTextStyle.body.copyWith(
                        color: AppColors.textMuted,
                      ),
                      filled: true,
                      fillColor: AppColors.card,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: AppColors.line),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: AppColors.ink),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (widget.fineMessage != null &&
                          _selectedTab == MyTripsTab.upcoming) ...[
                        TripFineBanner(message: widget.fineMessage!),
                        const SizedBox(height: 12),
                      ],
                      MyTripsFilterTabs(
                        selectedTab: _selectedTab,
                        onTabChanged: (tab) {
                          setState(() {
                            _selectedTab = tab;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      ..._buildTabBody(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabBody() {
    switch (_selectedTab) {
      case MyTripsTab.upcoming:
        return _buildUpcomingTab();
      case MyTripsTab.past:
        return _buildTripsList(
          _pastTrips.where(_matchesSearch).toList(),
          (trip) => PastTripCard(
            trip: trip,
            onRateTap: () => _openRateTrip(trip),
          ),
        );
      case MyTripsTab.cancelled:
        return _buildTripsList(
          MyTripsDummyData.cancelledTrips.where(_matchesSearch).toList(),
          (trip) => CancelledTripCard(trip: trip),
        );
    }
  }

  List<Widget> _buildUpcomingTab() {
    final upcoming =
        MyTripsDummyData.upcomingTrips.where(_matchesSearch).toList();
    final showExtras = !_isSearching || _searchQuery.trim().isEmpty;

    return [
      if (upcoming.isEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            AppStrings.noTripsFound,
            textAlign: TextAlign.center,
            style: AppTextStyle.small,
          ),
        )
      else
        for (int i = 0; i < upcoming.length; i++) ...[
          UpcomingTripCard(
            trip: upcoming[i],
            onViewTicketTap: () {},
          ),
          const SizedBox(height: 12),
        ],
      if (showExtras) ...[
        ReturnTripSuggestionCard(
          suggestion: MyTripsDummyData.suggestedReturnTrip,
          onBookReturnTap: () {
            final suggestion = MyTripsDummyData.suggestedReturnTrip;
            context.push(
              AppRoutes.results,
              extra: ResultsArgs(
                fromStation: suggestion.fromStation,
                toStation: suggestion.toStation,
                departureDate: suggestion.suggestedDate,
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        TripAlertsCard(
          tripAlertsEnabled: _tripAlertsEnabled,
          onTripAlertsChanged: (value) {
            setState(() {
              _tripAlertsEnabled = value;
            });
          },
          oneHourReminderEnabled: _oneHourReminderEnabled,
          onOneHourReminderChanged: (value) {
            setState(() {
              _oneHourReminderEnabled = value;
            });
          },
          seatAvailableAlertEnabled: _seatAvailableAlertEnabled,
          onSeatAvailableAlertChanged: (value) {
            setState(() {
              _seatAvailableAlertEnabled = value;
            });
          },
        ),
      ],
    ];
  }

  List<Widget> _buildTripsList(
    List<MyTripModel> trips,
    Widget Function(MyTripModel trip) itemBuilder,
  ) {
    if (trips.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Text(
            AppStrings.noTripsFound,
            textAlign: TextAlign.center,
            style: AppTextStyle.small,
          ),
        ),
      ];
    }

    return [
      for (int i = 0; i < trips.length; i++) ...[
        itemBuilder(trips[i]),
        if (i < trips.length - 1) const SizedBox(height: 12),
      ],
    ];
  }
}
