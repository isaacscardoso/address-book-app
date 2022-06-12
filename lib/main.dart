import 'package:address_book_app/provider/user_provider.dart';
import 'package:address_book_app/routes/app_routes.dart';
import 'package:address_book_app/views/user_form.dart';
import 'package:address_book_app/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const MyHomePage(),
      routes: {
        AppRoutes.home: (_) => const MyHomePage(),
        AppRoutes.userForm: (_) => UserForm()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserList();
  }
}
