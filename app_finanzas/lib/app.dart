import 'package:app_finanzas/config/app_routes.dart';
import 'package:app_finanzas/design/themes.dart';
import 'package:app_finanzas/pages/all_transactions.dart';
import 'package:app_finanzas/pages/home_page.dart';
import 'package:app_finanzas/pages/login_page.dart';
import 'package:flutter/material.dart';

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      /* routes: {
        AppRoutes.newPage: (context) => const HomePage(),
        AppRoutes.home: (context) => const HomePage()
      }, */
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.login:
            return MaterialPageRoute(
              builder: (context) => const LoginPage(),
            );
          case AppRoutes.home:
            return MaterialPageRoute(
              builder: (context) => HomePage(
                storeName: settings.arguments as String,
              ),
            );
          case AppRoutes.allTransactions:
            return MaterialPageRoute(
              builder: (context) => const AllTransactions(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const LoginPage(),
            );
        }
      },
    );
  }
}
