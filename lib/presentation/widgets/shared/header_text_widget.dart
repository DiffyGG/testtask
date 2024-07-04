import 'package:flutter/material.dart';
import 'package:test_task_2/presentation/utils/app_text_styles.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    super.key,
    required this.text,
    this.padding,
  });

  final String text;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(bottom: 20, left: 20),
        child: Text(
          text,
          style: AppTextStyles.header,
        ),
      ),
    );
  }
}
