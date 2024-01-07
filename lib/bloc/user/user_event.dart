part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class GetUser extends UserEvent {
  const GetUser(this.email);

  final String email;
}
