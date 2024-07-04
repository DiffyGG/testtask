part of 'general_bloc.dart';

final class GeneralState extends Equatable {
  const GeneralState({
    required this.selectedEmotionIndex,
    required this.emotions,
    required this.lastOptionSelected,
    required this.selectedOptions,
    required this.stressLevel,
    required this.conceitLevel,
    required this.note,
  });

  final int selectedEmotionIndex;
  final List<Emotion> emotions;
  final int lastOptionSelected;
  final List<bool> selectedOptions;
  final int stressLevel;
  final int conceitLevel;
  final String note;

  factory GeneralState.init() {
    return const GeneralState(
      selectedEmotionIndex: -1,
      emotions: EmotionData.emotions,
      lastOptionSelected: -1,
      selectedOptions: [],
      stressLevel: 50,
      conceitLevel: 50,
      note: '',
    );
  }

  GeneralState changeSelectedEmotion(int index) {
    final currSelectedEmotionIndex = selectedEmotionIndex == index ? -1 : index;
    final List<bool> selectedOptions;

    if (currSelectedEmotionIndex != -1) {
      selectedOptions = List.generate(emotions[index].options.length, (_) => false);
    } else {
      selectedOptions = List<bool>.empty();
    }

    return GeneralState(
      selectedEmotionIndex: currSelectedEmotionIndex,
      emotions: emotions,
      lastOptionSelected: -1,
      selectedOptions: selectedOptions,
      stressLevel: stressLevel,
      conceitLevel: conceitLevel,
      note: note,
    );
  }

  GeneralState changeSelectedOption(int index) {
    final list = [...selectedOptions];
    list[index] = !list[index];

    return GeneralState(
      selectedEmotionIndex: selectedEmotionIndex,
      emotions: emotions,
      lastOptionSelected: index,
      selectedOptions: list,
      stressLevel: stressLevel,
      conceitLevel: conceitLevel,
      note: note,
    );
  }

  GeneralState changeStressLevel(int stressLevel) {
    return GeneralState(
      selectedEmotionIndex: selectedEmotionIndex,
      emotions: emotions,
      lastOptionSelected: lastOptionSelected,
      selectedOptions: selectedOptions,
      stressLevel: stressLevel,
      conceitLevel: conceitLevel,
      note: note,
    );
  }

  GeneralState changeConceitLevel(int conceitLevel) {
    return GeneralState(
      selectedEmotionIndex: selectedEmotionIndex,
      emotions: emotions,
      lastOptionSelected: lastOptionSelected,
      selectedOptions: selectedOptions,
      stressLevel: stressLevel,
      conceitLevel: conceitLevel,
      note: note,
    );
  }

  GeneralState changeNote(String note) {
    if (note == this.note) {
      return this;
    }
    return GeneralState(
      selectedEmotionIndex: selectedEmotionIndex,
      emotions: emotions,
      lastOptionSelected: lastOptionSelected,
      selectedOptions: selectedOptions,
      stressLevel: stressLevel,
      conceitLevel: conceitLevel,
      note: note,
    );
  }

  Emotion get curEmotion => emotions[selectedEmotionIndex];

  @override
  List<Object> get props => [
        selectedEmotionIndex,
        emotions,
        lastOptionSelected,
        selectedOptions,
        stressLevel,
        conceitLevel,
      ];
}
