import 'package:address_book_app/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

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
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 24.0),
        itemCount: dummyUsers.length,
        itemBuilder: (context, i) => Text(dummyUsers.values.elementAt(i).name),
      ),
    );
  }
}
