import 'package:ayur_care/core/config/app_providers.dart';
import 'package:ayur_care/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(appProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayur Care',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen()
    );
  }
}


