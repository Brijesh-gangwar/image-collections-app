import 'package:flutter/material.dart';
import 'screens/collections_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Intern Assignment App',
      
      theme: ThemeData(
        useMaterial3: true,
        
      ),
      home: const CollectionsScreen(),
    );
  }
}
