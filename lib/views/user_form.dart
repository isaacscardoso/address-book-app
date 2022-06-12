import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adicionar Contato',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
