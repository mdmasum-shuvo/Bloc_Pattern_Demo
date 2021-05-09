import 'package:bloc_pattern_flutter/UserBloc.dart';
import 'package:bloc_pattern_flutter/UserListWidget.dart';
import 'package:bloc_pattern_flutter/UserRepository.dart';
import 'package:bloc_pattern_flutter/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UserComponent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          primaryColor: Colors.white),

      home: UserBlocProvider(),
    );
  }
}

class UserBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc Pattern Demo"),),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  child: BlocProvider<UserBloc>(
                    create: (context) =>
                    UserBloc(UserRepository())..add(FetchUserData()),
                    child: UserComponent(),
                  ))
            ],
          ),
        ));
  }
}

