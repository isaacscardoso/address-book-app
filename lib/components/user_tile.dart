import 'package:address_book_app/components/user_avatar.dart';
import 'package:address_book_app/models/user.dart';
import 'package:address_book_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar(avatar: user.avatarUrl),
      title: Text(user.name),
      subtitle:
          user.email == null || user.email!.isEmpty ? null : Text(user.email!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.userForm,
                arguments: user,
              );
            },
            icon: const Icon(Icons.edit, color: Colors.blue),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
