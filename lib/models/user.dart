import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String avatarUrl;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.avatarUrl,
  });
}
