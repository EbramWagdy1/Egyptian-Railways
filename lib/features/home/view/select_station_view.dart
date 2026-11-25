import 'package:egyptianrailways/core/utils/app_assets.dart';
import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:egyptianrailways/core/utils/app_strings.dart';
import 'package:egyptianrailways/core/utils/app_text_style.dart';
import 'package:egyptianrailways/core/widgets/custom_circle_icon_button.dart';
import 'package:egyptianrailways/features/home/data/home_dummy_data.dart';
import 'package:egyptianrailways/features/home/model/station_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SelectStationView extends StatefulWidget {
  const SelectStationView({
    super.key,
    this.selectedStation,
  });

  final String? selectedStation;

  @override
  State<SelectStationView> createState() => _SelectStationViewState();
}

class _SelectStationViewState extends State<SelectStationView> {
  final TextEditingController _searchController = TextEditingController();
  StationArea _selectedArea = StationArea.all;
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<StationModel> get _filteredStations {
    return HomeDummyData.popularStations.where((station) {
      final matchesArea =
          _selectedArea == StationArea.all || station.area == _selectedArea;
      final trimmed = _query.trim();
      final matchesQuery = trimmed.isEmpty ||
          station.displayName.contains(trimmed) ||
          station.shortName.contains(trimmed) ||
          station.governorate.contains(trimmed);
      return matchesArea && matchesQuery;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final stations = _filteredStations;

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
                      AppStrings.selectStation,
                      style: AppTextStyle.h3,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            _query = value;
                          });
                        },
                        style: AppTextStyle.body,
                        decoration: InputDecoration(
                          hintText: AppStrings.searchStation,
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
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < StationArea.values.length; i++) ...[
                              _AreaChip(
                                label: StationArea.values[i].label,
                                isSelected:
                                    _selectedArea == StationArea.values[i],
                                onTap: () {
                                  setState(() {
                                    _selectedArea = StationArea.values[i];
                                  });
                                },
                              ),
                              if (i < StationArea.values.length - 1)
                                const SizedBox(width: 8),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        AppStrings.popularStations,
                        style: AppTextStyle.sectionTitle,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 4,
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
                        child: stations.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Text(
                                  'لا توجد محطات مطابقة',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.small,
                                ),
                              )
                            : Column(
                                children: [
                                  for (int i = 0; i < stations.length; i++) ...[
                                    _StationRow(
                                      station: stations[i],
                                      isSelected:
                                          widget.selectedStation ==
                                              stations[i].shortName ||
                                          widget.selectedStation ==
                                              stations[i].displayName,
                                      onTap: () => context.pop(
                                        stations[i].shortName,
                                      ),
                                    ),
                                    if (i < stations.length - 1)
                                      const Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: AppColors.line,
                                      ),
                                  ],
                                ],
                              ),
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

class _AreaChip extends StatelessWidget {
  const _AreaChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.ink : AppColors.card,
          borderRadius: BorderRadius.circular(99),
          border: isSelected ? null : Border.all(color: AppColors.line),
        ),
        child: Text(
          label,
          style: AppTextStyle.captionSemiBold.copyWith(
            color: isSelected ? AppColors.textOnDark : AppColors.ink,
          ),
        ),
      ),
    );
  }
}

class _StationRow extends StatelessWidget {
  const _StationRow({
    required this.station,
    required this.isSelected,
    required this.onTap,
  });

  final StationModel station;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.successBg : AppColors.sky,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.iconStation,
                      width: 22,
                      height: 22,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      station.displayName,
                      style: isSelected
                          ? AppTextStyle.bodyBold
                          : AppTextStyle.bodySemiBold,
                    ),
                    Text(
                      station.governorate,
                      style: AppTextStyle.caption,
                    ),
                  ],
                ),
              ],
            ),
            if (isSelected)
              SvgPicture.asset(
                AppAssets.iconCheck,
                width: 24,
                height: 24,
              )
            else
              Text(
                '›',
                style: AppTextStyle.body.copyWith(
                  fontSize: 18,
                  color: AppColors.textMuted,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
