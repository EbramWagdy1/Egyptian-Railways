import 'package:egyptianrailways/core/routing/app_routes.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/features/results/data/results_dummy_data.dart';
import 'package:egyptianrailways/features/results/model/train_result_model.dart';
import 'package:egyptianrailways/features/results/view/widgets/results_days_selector.dart';
import 'package:egyptianrailways/features/results/view/widgets/results_filter_chips.dart';
import 'package:egyptianrailways/features/results/view/widgets/results_top_bar.dart';
import 'package:egyptianrailways/features/results/view/widgets/train_result_card.dart';
import 'package:egyptianrailways/features/seat_selection/model/seat_selection_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({
    super.key,
    required this.args,
  });

  final ResultsArgs args;

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  late DateTime _selectedDate;
  late List<DateTime> _dayStrip;
  TrainFilter _selectedFilter = TrainFilter.all;
  final Set<String> _notifiedTrains = {};

  @override
  void initState() {
    super.initState();
    final dep = DateTime(
      widget.args.departureDate.year,
      widget.args.departureDate.month,
      widget.args.departureDate.day,
    );
    _selectedDate = dep;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startDay = dep.isAfter(today)
        ? dep.subtract(const Duration(days: 1))
        : today;
    _dayStrip = List.generate(
      4,
      (index) => startDay.add(Duration(days: index)),
    );
  }

  List<TrainResultModel> get _filteredTrains {
    final list = List<TrainResultModel>.from(ResultsDummyData.trains);
    switch (_selectedFilter) {
      case TrainFilter.all:
        return list;
      case TrainFilter.fastest:
        final available = list.where((t) => !t.isFull).toList()
          ..sort((a, b) => a.durationMinutes.compareTo(b.durationMinutes));
        return available;
      case TrainFilter.firstClass:
        return list.where((t) => t.isFirstClass).toList();
      case TrainFilter.ac:
        return list.where((t) => t.isAc).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final trains = _filteredTrains;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ResultsTopBar(
                fromStation: widget.args.fromStation,
                toStation: widget.args.toStation,
                onBackTap: () => context.pop(),
                onFilterTap: () {
                  setState(() {
                    final nextIndex =
                        (_selectedFilter.index + 1) % TrainFilter.values.length;
                    _selectedFilter = TrainFilter.values[nextIndex];
                  });
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ResultsDaysSelector(
                        days: _dayStrip,
                        selectedDate: _selectedDate,
                        onDaySelected: (day) {
                          setState(() {
                            _selectedDate = day;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      ResultsFilterChips(
                        selectedFilter: _selectedFilter,
                        onFilterChanged: (filter) {
                          setState(() {
                            _selectedFilter = filter;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      for (int i = 0; i < trains.length; i++) ...[
                        TrainResultCard(
                          train: trains[i],
                          isNotified:
                              _notifiedTrains.contains(trains[i].trainNumber),
                          onTap: () {
                            context.push(
                              AppRoutes.seatSelection,
                              extra: SeatSelectionArgs(
                                train: trains[i],
                                fromStation: widget.args.fromStation,
                                toStation: widget.args.toStation,
                                departureDate: _selectedDate,
                              ),
                            );
                          },
                          onNotifyTap: () {
                            setState(() {
                              final id = trains[i].trainNumber;
                              if (_notifiedTrains.contains(id)) {
                                _notifiedTrains.remove(id);
                              } else {
                                _notifiedTrains.add(id);
                              }
                            });
                          },
                        ),
                        if (i < trains.length - 1) const SizedBox(height: 8),
                      ],
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
