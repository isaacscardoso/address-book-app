import 'package:address_book_app/provider/user_provider.dart';
import 'package:address_book_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:address_book_app/components/user_tile.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda de Contatos',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.userForm,
              );
            },
            icon: const Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 24.0),
        itemCount: users.count,
        itemBuilder: (context, i) => UserTile(user: users.byIndex(i)),
      ),
    );
  }
}
