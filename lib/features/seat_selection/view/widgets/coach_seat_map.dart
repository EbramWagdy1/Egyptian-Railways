import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/features/seat_selection/model/seat_selection_model.dart';
import 'package:flutter/material.dart';

class CoachSeatMap extends StatelessWidget {
  const CoachSeatMap({
    super.key,
    required this.seats,
    required this.selectedSeat,
    required this.onSeatTap,
  });

  final List<SeatModel> seats;
  final int? selectedSeat;
  final ValueChanged<int> onSeatTap;

  @override
  Widget build(BuildContext context) {
    final rowCount = (seats.length / 4).ceil();
    final availableCount = seats.where((s) => !s.isBooked).length;

    return Container(
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'شباك',
                style: AppTextStyle.tiny.copyWith(color: const Color(0xFF3E6FA8)),
              ),
              Text(
                'مقدمة العربة · $availableCount متاح',
                style: AppTextStyle.micro.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'شباك',
                style: AppTextStyle.tiny.copyWith(color: const Color(0xFF3E6FA8)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 1, thickness: 1, color: AppColors.line),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: rowCount,
              separatorBuilder: (_, _) => const SizedBox(height: 7),
              itemBuilder: (context, rowIndex) {
                final base = rowIndex * 4;
                SeatModel? seatAt(int offset) {
                  final idx = base + offset;
                  return idx < seats.length ? seats[idx] : null;
                }

                return Row(
                  children: [
                    Expanded(
                      child: _SeatTile(
                        seat: seatAt(0),
                        isSelected: seatAt(0)?.number == selectedSeat,
                        onTap: onSeatTap,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _SeatTile(
                        seat: seatAt(1),
                        isSelected: seatAt(1)?.number == selectedSeat,
                        onTap: onSeatTap,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _SeatTile(
                        seat: seatAt(2),
                        isSelected: seatAt(2)?.number == selectedSeat,
                        onTap: onSeatTap,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _SeatTile(
                        seat: seatAt(3),
                        isSelected: seatAt(3)?.number == selectedSeat,
                        onTap: onSeatTap,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SeatTile extends StatelessWidget {
  const _SeatTile({
    required this.seat,
    required this.isSelected,
    required this.onTap,
  });

  final SeatModel? seat;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    if (seat == null) {
      return const SizedBox(height: 32);
    }

    final model = seat!;
    final Color bgColor;
    final Color borderColor;
    final Color textColor;

    if (isSelected) {
      bgColor = AppColors.primary;
      borderColor = AppColors.primary;
      textColor = AppColors.textOnDark;
    } else if (model.isBooked) {
      bgColor = AppColors.line;
      borderColor = AppColors.line;
      textColor = AppColors.textMuted;
    } else if (model.isWindow) {
      bgColor = AppColors.sky;
      borderColor = AppColors.line;
      textColor = AppColors.ink;
    } else {
      bgColor = AppColors.card;
      borderColor = AppColors.line;
      textColor = AppColors.ink;
    }

    return GestureDetector(
      onTap: model.isBooked ? null : () => onTap(model.number),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        height: 32,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: borderColor),
        ),
        alignment: Alignment.center,
        child: Text(
          '${model.number}',
          style: AppTextStyle.micro.copyWith(
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
