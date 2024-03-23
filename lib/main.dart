import 'package:dressingroom/controller/dressing_provider.dart';
import 'package:dressingroom/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DressingProvider(),)
      ],
      child: const MaterialApp(
        title: 'DressingRoom',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
