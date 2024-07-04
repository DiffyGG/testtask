// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_2/presentation/bloc/general_bloc.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';
import 'package:test_task_2/presentation/widgets/emotion/emotion_section_widget.dart';
import 'package:test_task_2/presentation/widgets/note_widget.dart';
import 'package:test_task_2/presentation/widgets/slider/slider_container_widget.dart';
import 'package:test_task_2/presentation/widgets/submit_button_widget.dart';
import 'package:test_task_2/presentation/widgets/time_bar_widget.dart';
import 'package:test_task_2/presentation/widgets/toggle_button_widget.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  static const _separator = SizedBox(height: 36);

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final generalBloc = BlocProvider.of<GeneralBloc>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            TimeBarWidget(),
            SizedBox(height: 22),
            ToggleButtonWidget(
              blogPage: SingleChildScrollView(
                child: Column(
                  children: [
                    EmotionSectionWidget(),
                    GeneralPage._separator,
                    SliderContainerWidget(
                      header: 'Уровень стресса',
                      leftEdgeText: 'Низкий',
                      rightEdgeText: 'Высокий',
                      onChangeEnd: (stressLevel) => generalBloc.add(StressLevelChangedEvent(stressLevel: stressLevel)),
                    ),
                    GeneralPage._separator,
                    SliderContainerWidget(
                      header: 'Самооценка',
                      leftEdgeText: 'Нуверенность',
                      rightEdgeText: 'Уверенность',
                      onChangeEnd: (conceitLevel) => generalBloc.add(ConceitLevelChangedEvent(conceitLevel: conceitLevel)),
                    ),
                    GeneralPage._separator,
                    NoteWidget(
                      textEditingController: _textEditingController,
                    ),
                    GeneralPage._separator,
                    SubmitButtonWidget(
                      noteTextEditingController: _textEditingController,
                    ),
                    GeneralPage._separator,
                  ],
                ),
              ),
              statisticPage: Center(
                child: Text('Работает :)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
