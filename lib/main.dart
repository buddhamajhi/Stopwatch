import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/provider/time_provider.dart';
import 'stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<TimeProvider>(
          create: (context) => TimeProvider(),
          child: const Stopwatch(),
        ));
  }
}
