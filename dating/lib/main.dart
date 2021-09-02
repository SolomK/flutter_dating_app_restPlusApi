import 'package:dating/dating/dating.dart';
import 'package:dating/dating/repository/dating_repository.dart';
import 'package:dating/dating/screens/dating_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import 'bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final DatingRepository datingRepository = DatingRepository(
    dataProvider: DatingDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(
    DatingApp(datingRepository: datingRepository),
  );
}

class DatingApp extends StatelessWidget {
  final DatingRepository datingRepository;

  DatingApp({ required this.datingRepository})
      // ignore: unnecessary_null_comparison
      : assert(datingRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.datingRepository,
      child: BlocProvider(
        create: (context) => DatingBloc(datingRepository: this.datingRepository)
          ..add(DatingLoad()),
        child: MaterialApp(
          title: 'Dating App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute:DatingAppRoute.generateRoute,
        ),
      ),
    );
  }
}