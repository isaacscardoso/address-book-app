class User {
  final String id;
  final String name;
  final String phone;
  final String? email;
  final String? avatarUrl;

  const User({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    this.avatarUrl,
  });

  @override
  String toString() {
    return '$id - $name ($phone)';
  }
}
