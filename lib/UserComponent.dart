import 'package:bloc_pattern_flutter/UserBloc.dart';
import 'package:bloc_pattern_flutter/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //List<User> userList;
    return BlocConsumer<UserBloc, UserState>(
      listener: (BuildContext context, UserState state) {},
      builder: (context, state) {
        if (state is Error)
          return Center(
            child: Text("Data loaded failed"),
          );
        else if (state is Success)
          return ListView.builder(
            itemCount: state.getData.length,
            itemBuilder: (context, index){
              final movie = state.getData[index];
              return ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ClipRRect(
                        child: Icon(Icons.person),
                        borderRadius:BorderRadius.circular(10),
                      ),
                    ),
                    Flexible(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(movie.name),
                                Text(movie.id),
                              ],
                            )
                        ))
                  ],
                ),
              );
            });
        else
          return Center(
            child:CircularLoading()
          );
      },
    );
  }
}

class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new WillPopScope(
        onWillPop: () async => false,
        child: Platform.isIOS
            ? new CupertinoAlertDialog(
                title: new Text(
                  "Loading...",
                  style: TextStyle(fontSize: 20),
                ),
                content: new CupertinoActivityIndicator(radius: 13.0),
              )
            : AlertDialog(
                title: Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                content: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
      ),
    );
  }
}
