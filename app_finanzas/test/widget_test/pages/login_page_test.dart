import 'package:app_finanzas/design/copy.dart';
import 'package:app_finanzas/models/user.dart';
import 'package:app_finanzas/pages/login_page.dart';
import 'package:app_finanzas/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final fakeApp = UserProvider(
  userData: User(name: ''),
  child: MaterialApp(
    home: LoginPage(),
    routes: {
      'home': (context) => const Scaffold(),
    },
  ),
);

void main() {
  group('Find all widgets on screen', () {
    testWidgets('find title', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const title = AppCopys.hello;
      //Act
      final findedTitle = find.text(title);
      //Assert
      expect(findedTitle, findsOneWidget);
    });
    testWidgets('find by key the input-name', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const inputNameKey = Key('input-name');
      //Act
      final findedInputName = find.byKey(inputNameKey);
      //Assert
      expect(findedInputName, findsOneWidget);
    });
    testWidgets('find button by type', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      //Act
      final findedInputPswd = find.byType(ElevatedButton);
      //Assert
      expect(findedInputPswd, findsOneWidget);
    });
  });
  group('Be able to interact with widgets on the screen', () {
    testWidgets('fill user name', (widgetTester) async {
      //Arrenge
      const userName = 'Paul';
      await widgetTester.pumpWidget(fakeApp);
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      //Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      //Assert
      final findedUserName = find.text(userName);
      expect(findedUserName, findsOneWidget);
    });
  });
  group('Testing user interaction scenarios with our widgets', () {
    testWidgets('the user name is filled in correctly but not the password',
        (widgetTester) async {
      //Arrenge

      await widgetTester.pumpWidget(fakeApp);
      const expectError = AppErrors.userPsw;
      const userName = 'Paul';
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      final findedBtn = find.byType(ElevatedButton);
      String? userPsw;

      //Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();
      //Assert
      final findedError = find.text(expectError);
      expect(findedError, findsOneWidget);
    });
    testWidgets('the user name is wrong but the password is correct',
        (widgetTester) async {
      //Arrenge

      await widgetTester.pumpWidget(fakeApp);
      const expectError = AppErrors.userErrorLen;
      const userName = 'Paulincorrect';
      const userPswCorrect = 'correct';
      const inputNameKey = Key('input-name');
      const inputPswKey = Key('input-password');
      final findedInputName = find.byKey(inputNameKey);
      final findedInputPsw = find.byKey(inputPswKey);
      final findedBtn = find.byType(ElevatedButton);
      String? userPsw;

      //Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.enterText(findedInputPsw, userPswCorrect);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();
      //Assert
      final findedError = find.text(expectError);
      expect(findedError, findsOneWidget);
    });
    testWidgets('data is filled in incorrectly', (widgetTester) async {
      //Arrenge

      await widgetTester.pumpWidget(fakeApp);
      const expectError = AppErrors.userPsw;
      const expectErrorName = AppErrors.userError;
      const userName = 'Paul';
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      final findedBtn = find.byType(ElevatedButton);
      String? userPsw;

      //Act
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();
      //Assert
      final findedError = find.text(expectError);
      final findedErrorName = find.text(expectErrorName);
      expect(findedError, findsOneWidget);
      expect(findedErrorName, findsOneWidget);
    });
    testWidgets('data is filled in correctly', (widgetTester) async {
      //Arrenge

      await widgetTester.pumpWidget(fakeApp);
      const userName = 'Paul';
      const userPswCorrect = 'correct';
      const inputNameKey = Key('input-name');
      const inputPswKey = Key('input-password');
      final findedInputName = find.byKey(inputNameKey);
      final findedInputPsw = find.byKey(inputPswKey);
      final findedBtn = find.byType(ElevatedButton);

      //Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.enterText(findedInputPsw, userPswCorrect);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();
      //Assert
      expect(find.text(AppErrors.userError), findsNothing);
      expect(find.text(AppErrors.userErrorLen), findsNothing);
      expect(find.text(AppErrors.userPsw), findsNothing);
    });
  });
}
