import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, this.avatar}) : super(key: key);

  final String? avatar;

  @override
  Widget build(BuildContext context) {
    if (avatar == null || avatar!.isEmpty) {
      return const CircleAvatar(child: Icon(Icons.person));
    }
    return CircleAvatar(
      backgroundImage: NetworkImage(avatar!),
    );
  }
}

