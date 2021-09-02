import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Dating extends Equatable {
  Dating(
      {
   required this.password, required this.username
     });

  final String username;
  final String password;
 

  @override
  List<Object> get props => [username, password];

  factory Dating.fromJson(Map<String, dynamic> json) {
    return Dating(
      username: json['username'],
      password: json['password'],
      
    ); // this means there is something happenin second time that is devoted to it
  }

  @override
  String toString() => 'Dating { username: $username, password: $password }';
}