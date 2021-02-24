part of 'login_cubit.dart';

enum LoginPage { phone, code }

class LoginState extends Equatable {
  const LoginState(
      {this.phoneStatus = FormzStatus.pure,
      this.codeStatus = FormzStatus.pure,
      this.phone = const Phone.pure(),
      this.code = const Code.pure(),
      this.page = LoginPage.phone});

  final FormzStatus phoneStatus;
  final FormzStatus codeStatus;
  final Phone phone;
  final Code code;
  final LoginPage page;

  @override
  List<Object> get props => [phoneStatus, codeStatus, phone, code, page];

  LoginState copyWith(
      {FormzStatus phoneStatus,
      FormzStatus codeStatus,
      Phone phone,
      Code code,
      LoginPage page}) {
    return LoginState(
        phoneStatus: phoneStatus ?? this.phoneStatus,
        codeStatus: codeStatus ?? this.codeStatus,
        phone: phone ?? this.phone,
        code: code ?? this.code,
        page: page ?? this.page);
  }
}

class LoginInitial extends LoginState {}
