class User {
  final String? id;
  final String? email;
  final String? avatarUrl;
  final String name;
  final String phone;
  
  const User({
    this.id,
    this.email,
    this.avatarUrl,
    required this.name,
    required this.phone,
  });

  @override
  String toString() {
    return '$id - $name ($phone)';
  }
}
