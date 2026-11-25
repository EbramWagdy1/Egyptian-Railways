import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleIconButton extends StatelessWidget {
  const CustomCircleIconButton({
    super.key,
    required this.assetPath,
    this.onTap,
    this.backgroundColor = AppColors.sky,
    this.iconColor,
    this.size = 34,
    this.iconSize = 18,
  });

  final String assetPath;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color? iconColor;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: SvgPicture.asset(
              assetPath,
              width: iconSize,
              height: iconSize,
              colorFilter: iconColor != null
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
