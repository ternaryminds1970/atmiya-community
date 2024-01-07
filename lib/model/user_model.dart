class UserModel {
  final String name;
  final String email;
  final String userType;

  const UserModel({
    required this.name,
    required this.email,
    required this.userType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          userType == other.userType);

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ userType.hashCode;

  @override
  String toString() {
    return 'UserModel{ name: $name, email: $email, userType: $userType,}';
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? userType,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'userType': userType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      userType: map['type'] as String,
    );
  }

}