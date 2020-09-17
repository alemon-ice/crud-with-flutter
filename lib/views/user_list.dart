import 'package:crud_flutter/components/user_tile.dart';
import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              users.put(User(
                name: 'Leonardo Moura',
                email: 'leonardo.moura@client.com',
                password: 'leonardo_client_1234',
                avatarUrl:
                    'https://cdn.pixabay.com/photo/2020/05/16/00/32/wallpapers-5175525_960_720.png',
              ));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
