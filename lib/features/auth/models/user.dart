// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String token;
  final String fullname;
  final String document;
  final String phone;

  User({
    required this.id,
    required this.token,
    required this.fullname,
    required this.document,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'token': token,
      'fullname': fullname,
      'document': document,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      token: map['token'] as String,
      fullname: map['fullname'] as String,
      document: map['document'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
