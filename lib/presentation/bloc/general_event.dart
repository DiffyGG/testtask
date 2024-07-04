part of 'general_bloc.dart';

sealed class GeneralEvent extends Equatable {
  const GeneralEvent();
}

final class SelectedEmotionChangedEvent extends GeneralEvent {
  const SelectedEmotionChangedEvent({
    required this.selectedEmotionIndex,
  });

  final int selectedEmotionIndex;

  @override
  List<Object?> get props => [selectedEmotionIndex];
}

final class SelectedOptionChangedEvent extends GeneralEvent {
  const SelectedOptionChangedEvent({
    required this.selectedOptionIndex,
  });

  final int selectedOptionIndex;

  @override
  List<Object?> get props => [selectedOptionIndex];
}

final class StressLevelChangedEvent extends GeneralEvent {
  const StressLevelChangedEvent({
    required this.stressLevel,
  });

  final double stressLevel;

  @override
  List<Object?> get props => [stressLevel];
}

final class ConceitLevelChangedEvent extends GeneralEvent {
  const ConceitLevelChangedEvent({
    required this.conceitLevel,
  });

  final double conceitLevel;

  @override
  List<Object?> get props => [conceitLevel];
}

final class SubmitedEvent extends GeneralEvent {
  const SubmitedEvent({
    required this.context,
    required this.note,
  });

  final BuildContext context;
  final String note;

  @override
  List<Object?> get props => [context, note];
}
