import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_2/presentation/bloc/general_bloc.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';
import 'package:test_task_2/presentation/utils/app_text_styles.dart';

class EmotionCard extends StatelessWidget {
  const EmotionCard({
    super.key,
    required this.index,
  });

  final int index;

  static const _boxShadow = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 10.0,
      color: Color.fromRGBO(182, 161, 192, 0.11),
    )
  ];

  static final _selectedBorder = Border.all(
    color: AppColors.primary,
    style: BorderStyle.solid,
    width: 2,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<GeneralBloc>(context).add(SelectedEmotionChangedEvent(selectedEmotionIndex: index)),
      child: BlocBuilder<GeneralBloc, GeneralState>(
        buildWhen: (prev, cur) {
          return prev.selectedEmotionIndex == index || cur.selectedEmotionIndex == index;
        },
        builder: (_, state) {
          final bool isSelected = state.selectedEmotionIndex == index;
          final emotion = state.emotions[index];

          return AnimatedContainer(
            width: 83,
            height: 118,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(76),
              ),
              boxShadow: isSelected ? null : _boxShadow,
              border: isSelected ? _selectedBorder : null,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage(emotion.imagePath),
                    fit: BoxFit.fitWidth,
                    errorBuilder: (_, __, ___) {
                      return const SizedBox.shrink();
                    },
                  ),
                  Text(
                    emotion.name,
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
