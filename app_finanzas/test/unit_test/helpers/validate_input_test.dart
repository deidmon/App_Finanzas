import 'package:app_finanzas/design/copy.dart';
import 'package:app_finanzas/pages/helpers/validate_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Testing Validate Input',
    () {
      test('invalid user null', () {
        //Arrenge -> nos preparamos para ejecutar el test
        String? inputValue;
        const expectedError = AppErrors.userError;

        //Act -> Ejecutamos la acción probrar
        final currentValue = validateInput(inputValue);
        //Assert -> Evaluamos el resultado
        expect(currentValue, expectedError);
      });
      test('invalid user', () {
        //Arrenge -> nos preparamos para ejecutar el test
        const inputValue = 'Weincoders';
        const expectedError = AppErrors.userErrorLen;

        //Act -> Ejecutamos la acción probrar
        final currentValue = validateInput(inputValue);
        //Assert -> Evaluamos el resultado
        expect(currentValue, expectedError);
      });
      test('valid user', () {
        //Arrenge -> nos preparamos para ejecutar el test
        const inputValue = 'Paul';
        String? expectedError;

        //Act -> Ejecutamos la acción probrar
        final currentValue = validateInput(inputValue);
        //Assert -> Evaluamos el resultado
        expect(currentValue, expectedError);
      });
    },
  );
}
