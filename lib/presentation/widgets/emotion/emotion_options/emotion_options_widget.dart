import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_2/presentation/bloc/general_bloc.dart';
import 'package:test_task_2/presentation/widgets/emotion/emotion_options/emotion_option_card.dart';

class EmotionOptionsWidget extends StatelessWidget {
  const EmotionOptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(
      buildWhen: (prev, cur) {
        return prev.selectedEmotionIndex != cur.selectedEmotionIndex;
      },
      builder: (_, state) {
        if (state.selectedEmotionIndex == -1) {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              clipBehavior: Clip.none,
              alignment: WrapAlignment.start,
              children: [
                ...List.generate(
                  state.curEmotion.options.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: EmotionOptionWidget(index: index),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
