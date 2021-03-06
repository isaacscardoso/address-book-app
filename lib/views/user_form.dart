import 'package:address_book_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:address_book_app/models/user.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formulary = GlobalKey<FormState>();

  final Map<String, String> _formularyData = {};

  void _loadFormularyData(User user) {
    _formularyData['id'] = user.id!;
    _formularyData['name'] = user.name;
    _formularyData['phone'] = user.phone;
    _formularyData['email'] = user.email!;
    _formularyData['avatarUrl'] = user.avatarUrl!;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User? user = ModalRoute.of(context)?.settings.arguments as User?;
    if (user != null) {
      _loadFormularyData(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Adicionar Contato',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_formulary.currentState!.validate()) {
                _formulary.currentState?.save();
                Provider.of<UserProvider>(context, listen: false).put(
                  User(
                    id: _formularyData['id'],
                    name: _formularyData['name']!,
                    phone: _formularyData['phone']!,
                    email: _formularyData['email'],
                    avatarUrl: _formularyData['avatarUrl'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formulary,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  initialValue: _formularyData['name'],
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Preencha o campo Nome.';
                    }
                    return null;
                  },
                  onSaved: (value) => _formularyData['name'] = value!,
                ),
                TextFormField(
                  initialValue: _formularyData['phone'],
                  decoration: const InputDecoration(labelText: 'Telefone'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Preencha o campo Telefone.';
                    } else if (value.length < 10 || value.length > 13) {
                      return 'Telefone inv??lido.';
                    }
                    return null;
                  },
                  onSaved: (value) => _formularyData['phone'] = value!,
                ),
                TextFormField(
                  initialValue: _formularyData['email'],
                  decoration: const InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => _formularyData['email'] = value!,
                ),
                TextFormField(
                  initialValue: _formularyData['avatarUrl'],
                  decoration: const InputDecoration(labelText: 'URL Avatar:'),
                  onSaved: (value) => _formularyData['avatarUrl'] = value!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
