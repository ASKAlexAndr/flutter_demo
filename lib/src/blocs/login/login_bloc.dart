import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../auth/auth_bloc.dart';
import '../../repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  LoginBloc({this.authRepository, this.authBloc}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is PhoneSubmitted) {
      yield LoginLoading();

      try {
        final code = await authRepository.getCode(phone: event.phone);
        print(code);
      } catch (e) {}
    }
  }
}
