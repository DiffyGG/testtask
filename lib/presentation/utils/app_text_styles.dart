import 'package:flutter/material.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';

final class AppTextStyles {
  static const header = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: AppColors.black,
  );

  static const bodySmall = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: AppColors.black,
  );

  static const bodyMedium = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.black,
  );

  static const bodyLarge = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: AppColors.white,
  );

  static const toggle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
}
