import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  const MyUser({
    required this.userId,
    required this.email,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object> get props => [userId, email, name];

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
  }) {
    return MyUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'name': name,
    };
  }

  static MyUser fromMap(Map<String, dynamic> map) {
    return MyUser(
      userId: map['userId'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }
}
