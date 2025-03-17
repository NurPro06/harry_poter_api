import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_poter_api/bloc/main_bloc.dart';
import 'package:harry_poter_api/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => MainBloc()..add(GetHarryDataEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
