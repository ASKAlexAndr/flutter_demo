part of 'login_cubit.dart';

enum LoginStatus { phone, loading, code }

class LoginState extends Equatable {
  const LoginState(
      {this.phone = "", this.code = "", this.status = LoginStatus.phone});

  final String phone;
  final String code;
  final LoginStatus status;

  @override
  List<Object> get props => [phone, code, status];

  LoginState copyWith(
      {FormzStatus phoneStatus,
      FormzStatus codeStatus,
      String phone,
      String code,
      LoginStatus status}) {
    return LoginState(
        phone: phone ?? this.phone,
        code: code ?? this.code,
        status: status ?? this.status);
  }
}
