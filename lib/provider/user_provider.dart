import 'dart:math';
import 'package:address_book_app/data/dummy_users.dart';
import 'package:flutter/material.dart';
import 'package:address_book_app/models/user.dart';

class UserProvider with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          phone: user.phone,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          phone: user.phone,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user.id.isNotEmpty) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
