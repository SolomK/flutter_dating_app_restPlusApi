import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/data_provider/data_provider.dart';
import 'package:dating_app/user/repository/user_repository.dart';
import 'package:dating_app/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  final UserRepository userRepository = UserRepository(
      userDataProvider: UserDataProvider(httpClient: http.Client()));
  runApp(DatingApp(
    userRepository: userRepository,
  ));
}

class DatingApp extends StatelessWidget {
  final UserRepository userRepository;
  DatingApp({required this.userRepository}) : assert(userRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.userRepository,
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: this.userRepository)..add(UserLoad()),
        child: MaterialApp(
          title: 'Dating App',
          theme: ThemeData(
            primaryColor: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity
          ),
          onGenerateRoute: DatingAppRoute.generateRoute,
        ),
      ),
    );
  }
}
