import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_button.dart';
import 'package:egyptianrailways/core/widgets/custom_circle_icon_button.dart';
import 'package:egyptianrailways/features/seat_selection/data/seat_selection_dummy_data.dart';
import 'package:egyptianrailways/features/seat_selection/model/seat_selection_model.dart';
import 'package:egyptianrailways/features/seat_selection/view/widgets/coach_seat_map.dart';
import 'package:egyptianrailways/features/seat_selection/view/widgets/coach_selector_strip.dart';
import 'package:egyptianrailways/features/seat_selection/view/widgets/seat_legend_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeatSelectionView extends StatefulWidget {
  const SeatSelectionView({
    super.key,
    required this.args,
  });

  final SeatSelectionArgs args;

  @override
  State<SeatSelectionView> createState() => _SeatSelectionViewState();
}

class _SeatSelectionViewState extends State<SeatSelectionView> {
  int _selectedCoach = 5;
  int? _selectedSeat;
  late List<SeatModel> _seats;

  @override
  void initState() {
    super.initState();
    _seats = SeatSelectionDummyData.generateSeatsForCoach(_selectedCoach);
  }

  void _onCoachSelected(int coach) {
    if (coach == _selectedCoach) return;
    setState(() {
      _selectedCoach = coach;
      _selectedSeat = null;
      _seats = SeatSelectionDummyData.generateSeatsForCoach(coach);
    });
  }

  void _onSeatTap(int seatNumber) {
    setState(() {
      _selectedSeat = _selectedSeat == seatNumber ? null : seatNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomCircleIconButton(
                          assetPath: AppAssets.iconBack,
                          backgroundColor: AppColors.sky,
                          iconColor: AppColors.ink,
                          onTap: () => context.pop(),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          AppStrings.selectSeatTitle,
                          style: AppTextStyle.h3,
                        ),
                      ],
                    ),
                    Text(
                      'عربة $_selectedCoach · قطار ${widget.args.train.trainNumber}',
                      style: AppTextStyle.caption,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CoachSelectorStrip(
                        coachCount: SeatSelectionDummyData.coachCount,
                        selectedCoach: _selectedCoach,
                        onCoachSelected: _onCoachSelected,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: CoachSeatMap(
                          seats: _seats,
                          selectedSeat: _selectedSeat,
                          onSeatTap: _onSeatTap,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SeatLegendRow(),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'الراكب',
                                  style: AppTextStyle.caption,
                                ),
                                if (_selectedSeat != null)
                                  Text(
                                    AppStrings.carAndSeat(
                                      '$_selectedCoach',
                                      '$_selectedSeat',
                                    ),
                                    style: AppTextStyle.captionBold.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                              ],
                            ),
                            const Text(
                              SeatSelectionDummyData.defaultPassengerName,
                              style: AppTextStyle.captionBold,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        text: AppStrings.confirmBooking,
                        height: 46,
                        borderRadius: 12,
                        fontSize: 13,
                        onPressed: _selectedSeat != null ? () {} : null,
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
