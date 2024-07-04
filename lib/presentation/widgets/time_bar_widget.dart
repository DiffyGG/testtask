import 'package:flutter/material.dart';
import 'package:test_task_2/presentation/utils/app_colors.dart';

class TimeBarWidget extends StatelessWidget {
  const TimeBarWidget({
    super.key,
  });

  String _getCurrentDateTime() {
    final DateTime date = DateTime.now();
    const List<String> monthList = ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'];
    final String minutes = date.minute < 10 ? '0${date.minute}' : '${date.minute}';

    return '${date.day} ${monthList[date.month]} ${date.hour}:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0).copyWith(bottom: 24.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            _getCurrentDateTime(),
            style: const TextStyle(
              color: AppColors.greyTwo,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/calendar.png'),
            ),
          ),
        ],
      ),
    );
  }
}
