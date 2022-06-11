import 'package:address_book_app/data/dummy_users.dart';
import 'package:address_book_app/models/user.dart';
import 'package:flutter/material.dart';

import '../components/user_tile.dart';

class UserList extends StatelessWidget {
  UserList({Key? key}) : super(key: key);

  final Map<String, User> users = {...dummyUsers};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Agenda de Contatos',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 24.0),
        itemCount: users.length,
        itemBuilder: (context, i) => UserTile(user: users.values.elementAt(i)),
      ),
    );
  }
}
