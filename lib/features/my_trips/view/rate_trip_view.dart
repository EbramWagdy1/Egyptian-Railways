import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_button.dart';
import 'package:egyptianrailways/core/widgets/custom_circle_icon_button.dart';
import 'package:egyptianrailways/features/my_trips/model/my_trip_model.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/rate_trip_notes_field.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/rate_trip_stars_card.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/rate_trip_summary_card.dart';
import 'package:egyptianrailways/features/my_trips/view/widgets/rate_trip_tags_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RateTripView extends StatefulWidget {
  const RateTripView({
    super.key,
    required this.trip,
    this.rewardPoints = 5,
  });

  final MyTripModel trip;
  final int rewardPoints;

  @override
  State<RateTripView> createState() => _RateTripViewState();
}

class _RateTripViewState extends State<RateTripView> {
  int _rating = 4;
  final Set<String> _selectedTags = {};
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _toggleTag(String tag) {
    setState(() {
      if (_selectedTags.contains(tag)) {
        _selectedTags.remove(tag);
      } else {
        _selectedTags.add(tag);
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
                      AppStrings.rateTripTitle,
                      style: AppTextStyle.h3,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RateTripSummaryCard(trip: widget.trip),
                      const SizedBox(height: 12),
                      RateTripStarsCard(
                        rating: _rating,
                        onRatingChanged: (value) {
                          setState(() {
                            _rating = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      RateTripTagsCard(
                        tags: AppStrings.rateTripTags,
                        selectedTags: _selectedTags,
                        onTagToggled: _toggleTag,
                      ),
                      const SizedBox(height: 14),
                      RateTripNotesField(controller: _notesController),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                      text: AppStrings.submitRating(widget.rewardPoints),
                      height: 50,
                      borderRadius: 14,
                      fontSize: 15,
                      onPressed:
                          _rating > 0 ? () => context.pop(_rating) : null,
                    ),
                    const SizedBox(height: 14),
                    Center(
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            AppStrings.skip,
                            style: AppTextStyle.bodySemiBold.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
