import 'package:flutter/material.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';
import 'package:test_task_2/presentation/utils/app_text_styles.dart';
import 'package:test_task_2/presentation/widgets/shared/header_text_widget.dart';
import 'package:test_task_2/presentation/widgets/slider/slider_widget.dart';

class SliderContainerWidget extends StatelessWidget {
  const SliderContainerWidget({
    super.key,
    required this.header,
    required this.leftEdgeText,
    required this.rightEdgeText,
    this.onChangeEnd,
  });

  final String header;
  final String leftEdgeText;
  final String rightEdgeText;

  final void Function(double)? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTextWidget(text: header),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 10.0,
                  color: Color.fromRGBO(182, 161, 192, 0.11),
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Column(
                children: [
                  const _RowSeparatorsWidget(),
                  SliderWidget(
                    onChangeEnd: onChangeEnd,
                  ),
                  _RangeEdgesWidget(
                    leftEdgeText: leftEdgeText,
                    rightEdgeText: rightEdgeText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RowSeparatorsWidget extends StatelessWidget {
  const _RowSeparatorsWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        6,
        (i) => Container(
          width: 2,
          height: 8,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
      ),
    );
  }
}

class _RangeEdgesWidget extends StatelessWidget {
  const _RangeEdgesWidget({
    required this.leftEdgeText,
    required this.rightEdgeText,
  });

  final String leftEdgeText;
  final String rightEdgeText;

  static final _textStyle = AppTextStyles.bodySmall.copyWith(
    color: AppColors.greyTwo,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leftEdgeText,
          style: _textStyle,
        ),
        const Spacer(),
        Text(
          rightEdgeText,
          style: _textStyle,
        ),
      ],
    );
  }
}
