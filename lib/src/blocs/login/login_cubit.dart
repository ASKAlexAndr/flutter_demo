import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginState());

  void phoneChanged(String phone) {
    emit(state.copyWith(
      status: LoginStatus.phone,
      phone: phone,
    ));
  }

  void codeChanged(String code) {
    emit(state.copyWith(code: code));
  }

  Future<void> phoneSubmit(String phone) async {
    if (phone.length == 16) {
      emit(state.copyWith(status: LoginStatus.loading));
      final data = await authRepository.getCode(phone: phone);
      if (data["result"] == "sms") {
        emit(state.copyWith(status: LoginStatus.code));
      }
    } else {}
  }

  Future<void> codeSubmit(String code) async {
    if (code.length == 4) {
      var phoneRaw = state.phone.replaceAll(new RegExp(r'\D+'), '');
      await authRepository.logIn(phone: phoneRaw, code: code);
    } else
      print("ERROR");
  }
}
