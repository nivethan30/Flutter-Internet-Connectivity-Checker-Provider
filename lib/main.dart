import 'providers/connectivity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ConnectivityProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
