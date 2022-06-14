import 'package:address_book_app/components/user_avatar.dart';
import 'package:address_book_app/models/user.dart';
import 'package:address_book_app/provider/user_provider.dart';
import 'package:address_book_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar(avatar: user.avatarUrl),
      title: Text(user.name),
      subtitle: user.phone.isEmpty ? null : Text(user.phone),
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Excluir ${user.name}'),
                  content: const Text('Deseja realmente excluir este contato?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Sim'),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                    TextButton(
                      child: const Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  ],
                ),
              ).then((confirmed) {
                if (confirmed) {
                  Provider.of<UserProvider>(context, listen: false).remove(user);
                }
              });
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
