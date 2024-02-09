import 'dart:developer' as dev;

import 'package:atmiya_community/bloc/auth/auth_cubit.dart';
import 'package:atmiya_community/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              context.read<UserBloc>().add(GetUser(state.email));
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error in log in: ${state.message}')),
              );
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().signIn(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                },
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
