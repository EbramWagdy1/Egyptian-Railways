import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class RateTripTagsCard extends StatelessWidget {
  const RateTripTagsCard({
    super.key,
    required this.tags,
    required this.selectedTags,
    required this.onTagToggled,
  });

  final List<String> tags;
  final Set<String> selectedTags;
  final ValueChanged<String> onTagToggled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            AppStrings.whatDidYouLike,
            style: AppTextStyle.h4,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: tags.map((tag) {
              final isSelected = selectedTags.contains(tag);
              return GestureDetector(
                onTap: () => onTagToggled(tag),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.ink : AppColors.sky,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    tag,
                    style: AppTextStyle.captionSemiBold.copyWith(
                      color: isSelected
                          ? AppColors.textOnDark
                          : AppColors.ink,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
