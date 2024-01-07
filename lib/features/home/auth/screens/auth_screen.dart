import 'dart:developer' as dev;

import 'package:atmiya_community/bloc/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../bloc/user/user_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              context.read<UserBloc>().add(GetUser(state.email));
            }else if (state is UnAuthenticated || state is AuthError) {
              context.go('/login');
            }
          },
        ),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserDataLoaded) {
              context.go('/home');
            }else if (state is UserNotRegistered) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User not registered!')),
              );
            }else if (state is UserDataError) {
              dev.log('Error ${state.message}', name: 'LoginScreen');
            }
          },
        ),
      ],
      child: const Scaffold(
        body: Center(
          child: Text('Auth Screen'),
        ),
      ),
    );
  }
}
