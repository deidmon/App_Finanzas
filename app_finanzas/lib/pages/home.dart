import 'package:app_finanzas/design/colors.dart';
import 'package:app_finanzas/widgets/home_app_bar_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        toolbarHeight: 97,
        backgroundColor: AppColors.brandLightColor,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 45, 16, 12),
          child: HomeAppBarTitle(),
        ),
      ),
      body: const Center(
        child: Text(
          'Hola Weincoders 🚀!!!',
        ),
      ),
    );
  }
}
