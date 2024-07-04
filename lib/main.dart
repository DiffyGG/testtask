import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_2/presentation/bloc/general_bloc.dart';
import 'package:test_task_2/presentation/pages/general_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralBloc(),
      child: const MaterialApp(
        home: GeneralPage(),
      ),
    );
  }
}
