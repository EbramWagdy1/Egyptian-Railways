import 'package:egyptianrailways/core/routing/app_routes.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/features/home/data/home_dummy_data.dart';
import 'package:egyptianrailways/features/home/model/home_trip_model.dart';
import 'package:egyptianrailways/features/home/view/widgets/booking_search_card.dart';
import 'package:egyptianrailways/features/home/view/widgets/frequent_routes_card.dart';
import 'package:egyptianrailways/features/home/view/widgets/home_top_bar.dart';
import 'package:egyptianrailways/features/home/view/widgets/next_trip_ticket_card.dart';
import 'package:egyptianrailways/features/home/view/widgets/quick_actions_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    this.userName = 'إبرام',
    this.bookedTrip,
  });

  final String userName;

  /// The next trip ticket card is only shown when a trip is booked.
  final BookedTripModel? bookedTrip;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _fromStation = 'أسيوط';
  String _toStation = 'القاهرة';
  bool _isRoundTrip = false;
  DateTime? _departureDate;
  DateTime? _returnDate;

  static const List<String> _arabicMonths = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  String? get _selectedDateLabel {
    if (_departureDate == null) return null;
    final dep = '${_departureDate!.day} ${_arabicMonths[_departureDate!.month - 1]}';
    if (!_isRoundTrip) return dep;
    if (_returnDate == null) return '$dep · اختار العودة';
    final ret = '${_returnDate!.day} ${_arabicMonths[_returnDate!.month - 1]}';
    return '$dep ← $ret';
  }

  void _swapStations() {
    setState(() {
      final temp = _fromStation;
      _fromStation = _toStation;
      _toStation = temp;
    });
  }

  Future<void> _selectStation({required bool isFrom}) async {
    final current = isFrom ? _fromStation : _toStation;
    final selected = await context.push<String>(
      AppRoutes.selectStation,
      extra: current,
    );
    if (selected == null || !mounted) return;
    setState(() {
      if (isFrom) {
        if (selected == _toStation) {
          _toStation = _fromStation;
        }
        _fromStation = selected;
      } else {
        if (selected == _fromStation) {
          _fromStation = _toStation;
        }
        _toStation = selected;
      }
    });
  }

  Future<void> _pickDate() async {
    final result = await context.push<SelectedDateResult>(
      AppRoutes.selectDate,
      extra: SelectDateArgs(
        fromStation: _fromStation,
        toStation: _toStation,
        isRoundTrip: _isRoundTrip,
        initialDeparture: _departureDate,
        initialReturn: _returnDate,
      ),
    );
    if (result != null && mounted) {
      setState(() {
        _departureDate = result.departureDate;
        _returnDate = result.returnDate;
      });
    }
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
            children: [
              HomeTopBar(
                userName: widget.userName,
                onNotificationTap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (widget.bookedTrip != null) ...[
                        NextTripTicketCard(
                          trip: widget.bookedTrip!,
                          onTap: () => context.go(AppRoutes.trips),
                        ),
                        const SizedBox(height: 20),
                      ],
                      BookingSearchCard(
                        fromStation: _fromStation,
                        toStation: _toStation,
                        isRoundTrip: _isRoundTrip,
                        selectedDateLabel: _selectedDateLabel,
                        onFromTap: () => _selectStation(isFrom: true),
                        onToTap: () => _selectStation(isFrom: false),
                        onSwapTap: _swapStations,
                        onDateTap: _pickDate,
                        onTripTypeChanged: (isRoundTrip) {
                          setState(() {
                            _isRoundTrip = isRoundTrip;
                            if (!isRoundTrip) {
                              _returnDate = null;
                            }
                          });
                        },
                        onBookTap: () {},
                      ),
                      const SizedBox(height: 20),
                      QuickActionsRow(
                        onQuickBookTap: () {},
                        onTrackTrainTap: () => context.go(AppRoutes.track),
                        onStationsTap: () {},
                        onMyTicketsTap: () => context.go(AppRoutes.trips),
                      ),
                      const SizedBox(height: 20),
                      FrequentRoutesCard(
                        routes: HomeDummyData.frequentRoutes,
                        onViewAllTap: () {},
                        onRouteTap: (route) {
                          setState(() {
                            _fromStation = route.fromStation;
                            _toStation = route.toStation;
                          });
                        },
                      ),
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
}
