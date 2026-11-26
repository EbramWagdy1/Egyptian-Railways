import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class RateTripNotesField extends StatelessWidget {
  const RateTripNotesField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          AppStrings.yourNotes,
          style: AppTextStyle.label,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 4,
          minLines: 4,
          style: AppTextStyle.body,
          decoration: InputDecoration(
            hintText: AppStrings.notesHint,
            hintStyle: AppTextStyle.hint,
            filled: true,
            fillColor: AppColors.background,
            contentPadding: const EdgeInsets.all(14),
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
      ],
    );
  }
}
