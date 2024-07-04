import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_2/presentation/bloc/general_bloc.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';
import 'package:test_task_2/presentation/utils/app_text_styles.dart';

class EmotionOptionWidget extends StatelessWidget {
  const EmotionOptionWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<GeneralBloc>(context).add(SelectedOptionChangedEvent(selectedOptionIndex: index)),
      child: BlocBuilder<GeneralBloc, GeneralState>(
        buildWhen: (prev, cur) {
          return cur.lastOptionSelected == index || prev.selectedEmotionIndex != cur.selectedEmotionIndex;
        },
        builder: (_, state) {
          final color = state.selectedOptions[index] ? AppColors.primary : AppColors.white;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 10.0,
                  color: Color.fromRGBO(182, 161, 192, 0.11),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              child: Text(
                state.curEmotion.options[index],
                style: AppTextStyles.bodySmall,
              ),
            ),
          );
        },
      ),
    );
  }
}
