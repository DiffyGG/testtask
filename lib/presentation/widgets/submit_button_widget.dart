import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_2/presentation/bloc/general_bloc.dart';

import 'package:test_task_2/presentation/utils/app_colors.dart';
import 'package:test_task_2/presentation/utils/app_text_styles.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.noteTextEditingController,
  });

  final TextEditingController noteTextEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.greyFour,
          ),
          onPressed: () {
            BlocProvider.of<GeneralBloc>(context).add(SubmitedEvent(
              context: context,
              note: noteTextEditingController.text,
            ));
          },
          child: const Text(
            'Сохранить',
            style: AppTextStyles.bodyLarge,
          ),
        ),
      ),
    );
  }
}
