import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFD62E2E);
  static const Color ink = Color(0xFF10243E);
  static const Color background = Color(0xFFF3F5F7);
  static const Color card = Color(0xFFFFFFFF);
  static const Color sky = Color(0xFFE6EEF7);
  static const Color line = Color(0xFFDCE3EA);

  static const Color textPrimary = ink;
  static const Color textMuted = Color(0xFF64788C);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textOnDarkMuted = Color(0xFFA9BAD0);
  static const Color textHint = Color(0xFF9AABBB);
  static const Color textDisabled = Color(0xFFB4C0CC);

  static const Color success = Color(0xFF16915B);
  static const Color successBg = Color(0xFFD4EBE1);

  static const Color warning = Color(0xFFF4B63F);
  static const Color warningBg = Color(0xFFFBEFD1);
  static const Color warningText = Color(0xFF9A6B00);
  static const Color warningTextStrong = Color(0xFF7A5500);

  static const Color error = Color(0xFFD62E2E);
  static const Color errorBg = Color(0xFFFBE0E0);
  static const Color errorText = Color(0xFFA12020);
  static const Color errorTextStrong = Color(0xFF8A1F1F);

  static const Color darkCard = ink;
  static const Color darkCardTrack = Color(0xFF2A4468);

  static const Color scanBackground = Color(0xFF0B1626);
  static const Color scanSurface = Color(0xFF13263E);
  static const Color scanQrDim = Color(0xFF3A5A86);

  static const Color shadow = Color(0x1210243E);
}

class AppColorsDark {
  AppColorsDark._();

  static const Color primary = AppColors.primary;
  static const Color background = Color(0xFF0B1626);
  static const Color card = Color(0xFF13263E);
  static const Color cardElevated = Color(0xFF1D3B66);
  static const Color sky = Color(0xFF1B3250);
  static const Color line = Color(0xFF25395A);

  static const Color textPrimary = Color(0xFFEEF3F8);
  static const Color textMuted = Color(0xFF93A7BD);

  static const Color success = Color(0xFF35C48A);
  static const Color successBg = Color(0xFF123A2C);
}
