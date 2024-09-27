import 'package:app_finanzas/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  final User userData;
  const UserProvider({super.key, required this.userData, required super.child});

  //Obtener la información solo utilizando el contexto
  static UserProvider of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<UserProvider>()!;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) =>
      oldWidget.userData.name != userData.name ? true : false;
}
