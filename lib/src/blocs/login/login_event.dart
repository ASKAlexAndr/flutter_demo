part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class PhoneSubmitted extends LoginEvent {
  final String phone;

  const PhoneSubmitted({this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() => 'PhoneSubmitted { phone: $phone }';
}

class CodeSubmitted extends LoginEvent {
  final String phone;
  final String code;

  const CodeSubmitted({this.phone, this.code});

  @override
  List<Object> get props => [phone, code];

  @override
  String toString() => 'CodeSubmitted { phone: $phone, code: $code }';
}
