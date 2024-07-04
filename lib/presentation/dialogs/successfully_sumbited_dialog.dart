import 'package:flutter/material.dart';

void showSuccessfullySumbitedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Успешно отправлено'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Отлично!'),
          ),
        ],
      );
    },
  );
}
