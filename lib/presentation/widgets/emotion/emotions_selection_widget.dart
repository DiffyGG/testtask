import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_2/presentation/bloc/general_bloc.dart';
import 'package:test_task_2/presentation/widgets/emotion/emotion_card.dart';

class EmotionsSelectionWidget extends StatelessWidget {
  const EmotionsSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emotions = BlocProvider.of<GeneralBloc>(context).state.emotions;
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          ...List.generate(
            emotions.length,
            (i) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: EmotionCard(index: i),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
