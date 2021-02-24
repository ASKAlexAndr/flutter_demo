import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/src/blocs/auth/auth_bloc.dart';
import 'package:flutter_demo/src/models/auth/code.dart';
import 'package:flutter_demo/src/models/auth/phone.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  LoginCubit(this.authRepository, this.authBloc) : super(LoginInitial());

  void phoneChanged(String value) {
    final phone = Phone.dirty(value);
    emit(state.copyWith(phone: phone, phoneStatus: Formz.validate([phone])));
  }

  void codeChanged(String value) {
    final code = Code.dirty(value);
    emit(state.copyWith(code: code, codeStatus: Formz.validate([code])));
  }

  Future<void> phoneSubmit(String phone) async {
    if (state.phoneStatus.isValidated) {
      final data = await authRepository.getCode(phone: phone);
      if (data.result == "success") emit(state.copyWith(page: LoginPage.code));
    } else
      print("ERROR");
  }

  Future<void> codeSubmit(String code) async {
    if (state.codeStatus.isValidated) {
      await authRepository.logIn(phone: state.phone.toString(), code: code);
    } else
      print("ERROR");
  }
}
