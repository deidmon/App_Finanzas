import 'package:app_finanzas/design/copy.dart';

String? validateInput(value) {
  if (value == null || value.isEmpty) {
    return AppErrors.userError;
  }
  if (value.length >= 10) {
    return AppErrors.userErrorLen;
  }
  return null;
}
