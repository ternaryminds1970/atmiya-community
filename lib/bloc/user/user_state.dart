part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserDataLoaded extends UserState {
  const UserDataLoaded(this.user);

  final UserModel user;
}

class UserNotRegistered extends UserState {}

class UserDataLoading extends UserState {}

class UserDataError extends UserState {
  const UserDataError(this.message);

  final String message;
}
