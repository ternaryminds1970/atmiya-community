import 'dart:async';
import 'dart:developer' as dev;

import 'package:atmiya_community/model/user_model.dart';
import 'package:atmiya_community/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitial()) {
    on<GetUser>(_onGetUser);
  }

  final UserRepository _userRepository;

  Future<void> _onGetUser(GetUser event, Emitter<UserState> emit) async {
    emit(UserDataLoading());
    try {
      final user = await _userRepository.getUserData(event.email);
      if (user == null) {
        emit(UserNotRegistered());
      }else {
        emit(UserDataLoaded(user));
      }
    }catch(e) {
      dev.log('Got user error: $e', name: 'UserBloc');
      emit(UserDataError(e.toString()));
    }
  }

  @override
  void onTransition(Transition<UserEvent, UserState> transition) {
    dev.log(transition.toString(), name: 'UserBloc');
    super.onTransition(transition);
  }
}
