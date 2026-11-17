import 'package:flutter/material.dart';

import 'app_colors.dart';

/// أنماط النصوص (Cairo للنصوص، Reem Kufi للعناوين والأرقام الكبيرة).
///
/// لازم تضيف الخطوط في pubspec.yaml (مكتوبة في آخر الملف).
class AppTextStyle {
  AppTextStyle._();

  static const String cairo = 'Cairo';
  static const String reemKufi = 'ReemKufi';

  // ── عناوين (Reem Kufi Bold) ───────────────────────────────
  /// رقم النقاط الكبير في شاشة الولاء.
  static const TextStyle display = TextStyle(
    fontFamily: reemKufi,
    fontWeight: FontWeight.w700,
    fontSize: 44,
    color: AppColors.ink,
  );

  /// عنوان الشاشة الرئيسي (مثال: "أدخل كود التأكيد").
  static const TextStyle h1 = TextStyle(
    fontFamily: reemKufi,
    fontWeight: FontWeight.w700,
    fontSize: 26,
    color: AppColors.ink,
  );

  /// عنوان كارت كبير (24 في الفيجما).
  static const TextStyle h2 = TextStyle(
    fontFamily: reemKufi,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: AppColors.ink,
  );

  /// رقم كبير (إحصائيات / ملخص) - 28 في الفيجما.
  static const TextStyle displaySmall = TextStyle(
    fontFamily: reemKufi,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: AppColors.ink,
  );

  /// عنوان الـ Top bar.
  static const TextStyle h3 = TextStyle(
    fontFamily: reemKufi,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppColors.ink,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: reemKufi,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.ink,
  );

  /// عنوان قسم داخل الشاشة (مثال: "آخر التفعيلات").
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: reemKufi,
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: AppColors.ink,
  );

  /// الأوقات الكبيرة (13:05 / 07:05).
  static const TextStyle time = TextStyle(
    fontFamily: reemKufi,
    fontWeight: FontWeight.w700,
    fontSize: 26,
    color: AppColors.ink,
  );

  // ── نصوص عادية (Cairo) ────────────────────────────────────
  static const TextStyle body = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.ink,
  );

  static const TextStyle bodySemiBold = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColors.ink,
  );

  static const TextStyle bodyBold = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppColors.ink,
  );

  static const TextStyle small = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: AppColors.textMuted,
  );

  static const TextStyle smallBold = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w700,
    fontSize: 13,
    color: AppColors.ink,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.textMuted,
  );

  static const TextStyle smallSemiBold = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: AppColors.ink,
  );

  static const TextStyle captionBold = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: AppColors.ink,
  );

  static const TextStyle captionSemiBold = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: AppColors.ink,
  );

  /// أصغر نص في التصميم (10).
  static const TextStyle tiny = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppColors.textMuted,
  );

  /// عنوان الحقل فوق الـ TextField.
  static const TextStyle label = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: AppColors.textMuted,
  );

  static const TextStyle hint = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.textHint,
  );

  /// نص صغير جدًا (وقت، ملاحظة تحت عنصر).
  static const TextStyle micro = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: AppColors.textMuted,
  );

  /// نص الـ badge والحالة.
  static const TextStyle badge = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w600,
    fontSize: 11,
  );

  static const TextStyle link = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColors.primary,
  );

  // ── الأزرار ───────────────────────────────────────────────
  static const TextStyle button = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: AppColors.textOnDark,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: AppColors.ink,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w700,
    fontSize: 13,
    color: AppColors.textOnDark,
  );

  // ── التاب بار ─────────────────────────────────────────────
  static const TextStyle tab = TextStyle(
    fontFamily: cairo,
    fontWeight: FontWeight.w600,
    fontSize: 11,
    color: AppColors.textMuted,
  );

  /// يرجّع TextTheme جاهز لـ ThemeData.
  static TextTheme textTheme({
    Color color = AppColors.ink,
    Color mutedColor = AppColors.textMuted,
  }) {
    return TextTheme(
      displayLarge: display.copyWith(color: color),
      displayMedium: displaySmall.copyWith(color: color),
      headlineLarge: h1.copyWith(color: color),
      headlineMedium: h2.copyWith(color: color),
      headlineSmall: h3.copyWith(color: color),
      titleMedium: sectionTitle.copyWith(color: color),
      bodyLarge: bodySemiBold.copyWith(color: color),
      bodyMedium: body.copyWith(color: color),
      bodySmall: small.copyWith(color: mutedColor),
      labelLarge: button,
      labelMedium: label.copyWith(color: mutedColor),
      labelSmall: caption.copyWith(color: mutedColor),
    );
  }
}

