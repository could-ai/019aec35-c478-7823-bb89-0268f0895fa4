import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/home_screen.dart';
import 'package:couldai_user_app/screens/results_screen.dart';

void main() {
  runApp(const HariApp());
}

class HariApp extends StatelessWidget {
  const HariApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hari Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange, // "Hari" means Day, so sunny orange
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/results': (context) => const ResultsScreen(),
      },
    );
  }
}
