import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task_2/data/emotion_data.dart';
import 'package:test_task_2/domain/entities/emotion.dart';
import 'package:test_task_2/presentation/dialogs/successfully_sumbited_dialog.dart';
import 'package:test_task_2/presentation/dialogs/unsuccessfully_sumbited_dialog.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(GeneralState.init()) {
    on<SelectedEmotionChangedEvent>(_onSelectedEmotionChanged);
    on<SelectedOptionChangedEvent>(_onSelectedOptionChanged);
    on<StressLevelChangedEvent>(_onStressLevelChanged);
    on<ConceitLevelChangedEvent>(_onConceitLevelChanged);

    on<SubmitedEvent>(_onSubmitEvent);
  }

  FutureOr<void> _onSelectedEmotionChanged(
    SelectedEmotionChangedEvent event,
    Emitter<GeneralState> emit,
  ) {
    emit(state.changeSelectedEmotion(event.selectedEmotionIndex));
  }

  FutureOr<void> _onSelectedOptionChanged(
    SelectedOptionChangedEvent event,
    Emitter<GeneralState> emit,
  ) {
    emit(state.changeSelectedOption(event.selectedOptionIndex));
  }

  FutureOr<void> _onStressLevelChanged(
    StressLevelChangedEvent event,
    Emitter<GeneralState> emit,
  ) {
    emit(state.changeStressLevel(event.stressLevel.round()));
    print(state.stressLevel);
  }

  FutureOr<void> _onConceitLevelChanged(
    ConceitLevelChangedEvent event,
    Emitter<GeneralState> emit,
  ) {
    emit(state.changeConceitLevel(event.conceitLevel.round()));
    print(state.conceitLevel);
  }

  FutureOr<void> _onSubmitEvent(
    SubmitedEvent event,
    Emitter<GeneralState> emit,
  ) async {
    if (state.selectedEmotionIndex != -1 && //
        state.selectedOptions.isNotEmpty &&
        event.note.isNotEmpty) {
      showSuccessfullySumbitedDialog(event.context);
      emit(GeneralState.init());
      return;
    }

    showUnsuccessfullySumbitedDialog(event.context);
  }
}
