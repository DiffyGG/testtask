import 'package:flutter/material.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';
import 'package:test_task_2/presentation/utils/app_text_styles.dart';
import 'package:test_task_2/presentation/widgets/shared/header_text_widget.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  late final ScrollController _scrollController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderTextWidget(text: 'Заметки'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(
              maxHeight: 180,
              minHeight: 90,
            ),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 10.0,
                  color: Color.fromRGBO(182, 161, 192, 0.11),
                )
              ],
            ),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: TextField(
                scrollController: _scrollController,
                controller: widget.textEditingController,
                focusNode: _focusNode,
                onTapOutside: (_) => _focusNode.unfocus(),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: AppTextStyles.bodyMedium,
                cursorColor: AppColors.black,
                decoration: const InputDecoration(
                  hintText: 'Введите заметку ...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
