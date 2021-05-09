import 'package:bloc_pattern_flutter/UserBloc.dart';
import 'package:bloc_pattern_flutter/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBlock = BlocProvider.of<UserBloc>(context);
    return Expanded(
        child: Column(
      children: [
        BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          userBlock.add(FetchUserData());

          return Container();
        }),
      ],
    ));
  }
}

class ShowUserList extends StatelessWidget {
  List<User> userList;

  ShowUserList(this.userList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            title: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: ClipRRect(
                    child: Icon(Icons.person),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.name),
                            Text(user.userId),
                          ],
                        )))
              ],
            ),
          );
        });
  }
}
