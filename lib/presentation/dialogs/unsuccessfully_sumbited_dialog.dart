import 'package:flutter/material.dart';

void showUnsuccessfullySumbitedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Для отправки нужно заполнить все поля'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Сейчас заполню!'),
          ),
        ],
      );
    },
  );
}
