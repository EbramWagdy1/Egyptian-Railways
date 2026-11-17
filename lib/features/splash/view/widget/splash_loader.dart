import 'package:egyptianrailways/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashLoader extends StatefulWidget {
  const SplashLoader({super.key});

  @override
  State<SplashLoader> createState() => _SplashLoaderState();
}

class _SplashLoaderState extends State<SplashLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final value = _controller.value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDot(0, value),
            const SizedBox(width: 8),
            _buildDot(1, value),
            const SizedBox(width: 8),
            _buildDot(2, value),
          ],
        );
      },
    );
  }

  Widget _buildDot(int index, double progress) {
    final double shifted = (progress - (index * 0.28)) % 1.0;
    final bool isHighlighted = shifted >= 0.0 && shifted < 0.38;

    final Color dotColor = isHighlighted
        ? AppColors.primary
        : (index == 1
            // ignore: deprecated_member_use
            ? Colors.white.withOpacity(0.6)
            // ignore: deprecated_member_use
            : Colors.white.withOpacity(0.3));

    final double scale = isHighlighted ? 1.15 : 1.0;

    return Transform.scale(
      scale: scale,
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: dotColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
