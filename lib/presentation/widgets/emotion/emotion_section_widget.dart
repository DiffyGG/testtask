import 'package:flutter/widgets.dart';
import 'package:test_task_2/presentation/widgets/emotion/emotion_options/emotion_options_widget.dart';
import 'package:test_task_2/presentation/widgets/emotion/emotions_selection_widget.dart';
import 'package:test_task_2/presentation/widgets/shared/header_text_widget.dart';

class EmotionSectionWidget extends StatelessWidget {
  const EmotionSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeaderTextWidget(
          text: 'Что чувствуешь?',
        ),
        EmotionsSelectionWidget(),
        EmotionOptionsWidget(),
      ],
    );
  }
}
