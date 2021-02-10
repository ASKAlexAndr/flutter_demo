import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/src/models/user.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';
import 'package:flutter_demo/src/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  StreamSubscription<AuthStatus> _authStatusSabscription;

  AuthBloc(
      {@required AuthRepository authRepository,
      @required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.unknown()) {
    _authStatusSabscription = _authRepository.status
        .listen((status) => add(AuthStatusChanged(status)));
  }
  // AuthBloc(this._authRepository, this._userRepository) : super(const AuthState.unknown());

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
      final user = await _userRepository.getUser();
      return user;
    } on Exception {
      return null;
    }
  }
}
