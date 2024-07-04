import 'package:flutter/material.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    this.onChangeEnd,
  });

  final Function(double)? onChangeEnd;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = 50;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: _CustomThumbShape(),
        trackHeight: 6,
        tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 0.0),
        overlayShape: SliderComponentShape.noOverlay,
        trackShape: _CustomTrackShape(),
      ),
      child: Slider(
        value: _value.toDouble(),
        min: 0,
        max: 100,
        thumbColor: AppColors.primary,
        inactiveColor: AppColors.greyFive,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        activeColor: AppColors.primary,
        onChanged: (value) {
          setState(() {
            _value = value.round();
          });
        },
        onChangeEnd: (value) {
          if (widget.onChangeEnd != null) {
            widget.onChangeEnd!(value);
          }
        },
      ),
    );
  }
}

// created by chatGPT
class _CustomThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(18);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paintWhite = Paint()..color = AppColors.white;
    canvas.drawCircle(center, 9, paintWhite);

    final Paint paintOrange = Paint()..color = Colors.orange;
    canvas.drawCircle(center, 5, paintOrange);
  }
}

// created by chatGPT
class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4.0;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
