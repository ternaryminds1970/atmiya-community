import 'dart:developer' as dev;

import 'package:atmiya_community/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial());

  final AuthRepository _authRepository;

  Future<void> authenticate() async {
    try {
      final isSignedIn = await _authRepository.isSignedIn();
      if (isSignedIn) {
        final email = _authRepository.getCurrentEmail();

        emit(Authenticated(email!));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      final credential = await _authRepository.signIn(
        email: email,
        password: password,
      );
      emit(Authenticated(credential.user!.email!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    dev.log(change.toString(), name: 'AuthCubit');
    super.onChange(change);
  }
}
