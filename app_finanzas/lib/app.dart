import 'package:app_finanzas/design/themes.dart';
import 'package:app_finanzas/pages/home.dart';
import 'package:flutter/material.dart';

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: const HomePage(),
    );
  }
}
