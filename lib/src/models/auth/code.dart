import 'package:formz/formz.dart';

enum CodeValidationError { empty, incorrect }

class Code extends FormzInput<String, CodeValidationError> {
  const Code.pure() : super.pure('');
  const Code.dirty([String value = '']) : super.dirty(value);

  @override
  CodeValidationError validator(String value) {
    if (value.isEmpty) return CodeValidationError.empty;
    if (value.length != 4) return CodeValidationError.incorrect;
    return null;
  }
}
