part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  const Authenticated(this.email);

  final String email;
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;
}
