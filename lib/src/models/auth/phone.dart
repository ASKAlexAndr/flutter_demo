import 'package:formz/formz.dart';

enum PhoneValidationError { empty, incorrect }

class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');
  const Phone.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneValidationError validator(String value) {
    if (value.isEmpty) return PhoneValidationError.empty;
    if (value.length != 11) return PhoneValidationError.incorrect;
    return null;
  }
}
