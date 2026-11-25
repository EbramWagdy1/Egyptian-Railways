import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_button.dart';
import 'package:egyptianrailways/core/widgets/custom_circle_icon_button.dart';
import 'package:egyptianrailways/features/home/model/home_trip_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectDateView extends StatefulWidget {
  const SelectDateView({
    super.key,
    required this.args,
  });

  final SelectDateArgs args;

  @override
  State<SelectDateView> createState() => _SelectDateViewState();
}

class _SelectDateViewState extends State<SelectDateView> {
  static const List<String> _arabicWeekdays = [
    'سبت',
    'أحد',
    'إثنين',
    'ثلاثاء',
    'أربعاء',
    'خميس',
    'جمعة',
  ];

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

  static const List<String> _fullArabicWeekdays = [
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];

  late DateTime _today;
  late DateTime _displayedMonth;
  DateTime? _departureDate;
  DateTime? _returnDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
    _departureDate = widget.args.initialDeparture != null
        ? DateTime(
            widget.args.initialDeparture!.year,
            widget.args.initialDeparture!.month,
            widget.args.initialDeparture!.day,
          )
        : null;
    _returnDate = widget.args.isRoundTrip && widget.args.initialReturn != null
        ? DateTime(
            widget.args.initialReturn!.year,
            widget.args.initialReturn!.month,
            widget.args.initialReturn!.day,
          )
        : null;
    final anchor = _departureDate ?? _today;
    _displayedMonth = DateTime(anchor.year, anchor.month);
  }

  bool get _canConfirm {
    if (widget.args.isRoundTrip) {
      return _departureDate != null && _returnDate != null;
    }
    return _departureDate != null;
  }

  bool get _canGoToPreviousMonth {
    final currentMonth = DateTime(_today.year, _today.month);
    return _displayedMonth.isAfter(currentMonth);
  }

  void _previousMonth() {
    if (!_canGoToPreviousMonth) return;
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
      );
    });
  }

  void _onDayTap(DateTime day) {
    if (day.isBefore(_today)) return;

    setState(() {
      if (!widget.args.isRoundTrip) {
        _departureDate = day;
        _returnDate = null;
        return;
      }

      if (_departureDate == null || _returnDate != null) {
        _departureDate = day;
        _returnDate = null;
      } else if (day.isAfter(_departureDate!)) {
        _returnDate = day;
      } else {
        _departureDate = day;
        _returnDate = null;
      }
    });
  }

  String _formatArabicDate(DateTime date) {
    final weekdayName = _fullArabicWeekdays[date.weekday - 1];
    final monthName = _arabicMonths[date.month - 1];
    return '$weekdayName ${date.day} $monthName';
  }

  String get _summaryText {
    final route = '${widget.args.fromStation} ← ${widget.args.toStation}';
    if (!widget.args.isRoundTrip) {
      if (_departureDate == null) {
        return 'اختار تاريخ الذهاب · $route';
      }
      return 'ذهاب: ${_formatArabicDate(_departureDate!)} · $route';
    }

    if (_departureDate == null) {
      return 'اختار تاريخ الذهاب والعودة · $route';
    }
    if (_returnDate == null) {
      return 'ذهاب: ${_formatArabicDate(_departureDate!)} · اختار تاريخ العودة';
    }
    return 'ذهاب: ${_formatArabicDate(_departureDate!)} · عودة: ${_formatArabicDate(_returnDate!)}';
  }

  List<DateTime?> _buildMonthCells() {
    final firstDay = DateTime(_displayedMonth.year, _displayedMonth.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(
      _displayedMonth.year,
      _displayedMonth.month,
    );
    final leadingEmpty = (firstDay.weekday % 7 + 1) % 7;
    final cells = <DateTime?>[
      ...List<DateTime?>.filled(leadingEmpty, null),
      for (int day = 1; day <= daysInMonth; day++)
        DateTime(_displayedMonth.year, _displayedMonth.month, day),
    ];
    while (cells.length % 7 != 0) {
      cells.add(null);
    }
    return cells;
  }

  @override
  Widget build(BuildContext context) {
    final cells = _buildMonthCells();
    final weekCount = cells.length ~/ 7;
    final monthTitle =
        '${_arabicMonths[_displayedMonth.month - 1]} ${_displayedMonth.year}';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    CustomCircleIconButton(
                      assetPath: AppAssets.iconBack,
                      backgroundColor: AppColors.sky,
                      iconColor: AppColors.ink,
                      onTap: () => context.pop(),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      AppStrings.selectDate,
                      style: AppTextStyle.h3,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _MonthArrowButton(
                                  icon: Icons.chevron_right_rounded,
                                  enabled: _canGoToPreviousMonth,
                                  onTap: _previousMonth,
                                ),
                                Text(
                                  monthTitle,
                                  style: AppTextStyle.h4,
                                ),
                                _MonthArrowButton(
                                  icon: Icons.chevron_left_rounded,
                                  enabled: true,
                                  onTap: _nextMonth,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: _arabicWeekdays
                                  .map(
                                    (wd) => Expanded(
                                      child: Text(
                                        wd,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.badge.copyWith(
                                          color: AppColors.textMuted,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 6),
                            for (int week = 0; week < weekCount; week++)
                              Row(
                                children: List.generate(7, (col) {
                                  final day = cells[week * 7 + col];
                                  if (day == null) {
                                    return const Expanded(
                                      child: SizedBox(height: 44),
                                    );
                                  }

                                  final isPast = day.isBefore(_today);
                                  final isToday = day == _today;
                                  final isDeparture = day == _departureDate;
                                  final isReturn = day == _returnDate;
                                  final isSelected = isDeparture || isReturn;
                                  final isInRange = widget.args.isRoundTrip &&
                                      _departureDate != null &&
                                      _returnDate != null &&
                                      day.isAfter(_departureDate!) &&
                                      day.isBefore(_returnDate!);

                                  return Expanded(
                                    child: GestureDetector(
                                      onTap:
                                          isPast ? null : () => _onDayTap(day),
                                      child: SizedBox(
                                        height: 44,
                                        child: Center(
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? AppColors.primary
                                                  : isInRange
                                                      ? AppColors.errorBg
                                                      : Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: isToday && !isSelected
                                                  ? Border.all(
                                                      color: AppColors.primary,
                                                      width: 1.5,
                                                    )
                                                  : null,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${day.day}',
                                              style: TextStyle(
                                                fontFamily: AppTextStyle.cairo,
                                                fontSize: 14,
                                                fontWeight: isSelected
                                                    ? FontWeight.w700
                                                    : FontWeight.w600,
                                                color: isSelected
                                                    ? AppColors.textOnDark
                                                    : isPast
                                                        ? AppColors.textDisabled
                                                        : (isToday || isInRange)
                                                            ? AppColors.primary
                                                            : AppColors.ink,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.sky,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _summaryText,
                          style: AppTextStyle.smallSemiBold,
                        ),
                      ),
                      const Spacer(),
                      CustomButton(
                        text: AppStrings.confirmDate,
                        onPressed: _canConfirm
                            ? () => context.pop(
                                  SelectedDateResult(
                                    departureDate: _departureDate!,
                                    returnDate: widget.args.isRoundTrip
                                        ? _returnDate
                                        : null,
                                  ),
                                )
                            : null,
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

class _MonthArrowButton extends StatelessWidget {
  const _MonthArrowButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: AppColors.sky,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Icon(
            icon,
            size: 20,
            color: enabled ? AppColors.ink : AppColors.textDisabled,
          ),
        ),
      ),
    );
  }
}
