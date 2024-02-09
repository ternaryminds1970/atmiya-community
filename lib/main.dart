import 'package:atmiya_community/bloc/auth/auth_cubit.dart';
import 'package:atmiya_community/bloc/filter/filter_bloc.dart';
import 'package:atmiya_community/bloc/upload/upload_bloc.dart';
import 'package:atmiya_community/bloc/user/user_bloc.dart';
import 'package:atmiya_community/config/router.dart';
import 'package:atmiya_community/repositories/auth_repository.dart';
import 'package:atmiya_community/repositories/student_repository.dart';
import 'package:atmiya_community/repositories/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => StudentRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),

      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
            )..authenticate(),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => FilterBloc(
              studentRepository: context.read<StudentRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => UploadBloc(
              studentRepository: context.read<StudentRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
