import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/src/repositories/user_repository.dart';
import '../../models/user.dart';
import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  StreamSubscription<AuthStatus> _authStatusSabscription;

  AuthBloc(this.authRepository, this.userRepository) : super(null) {
    _authStatusSabscription = authRepository.status
        .listen((status) => add(AuthStatusChanged(status)));
  }

  @override
  Future<void> close() {
    _authStatusSabscription?.cancel();
    authRepository.dispose();
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthStatusChanged) {
      yield await _mapAuthStatusChangedToState(event);
    }
  }

  Future<AuthState> _mapAuthStatusChangedToState(
      AuthStatusChanged event) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return const AuthState.unauthenticated();
      case AuthStatus.authenticated:
        final user = await _tryGetUser();
        return user != null
            ? AuthState.authenticated(user)
            : const AuthState.unauthenticated();
      default:
        return const AuthState.unknown();
    }
  }

  Future<User> _tryGetUser() async {
    try {
      final user = await userRepository.getUser();
      return user;
    } on Exception {
      return null;
    }
  }
}
