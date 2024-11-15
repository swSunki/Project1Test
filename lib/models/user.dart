import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userId;
  final String name;
  final String email;
  final String profileImage;
  final GeoPoint location;
  final Timestamp joinedDate;
  final List<String> favorites;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.location,
    required this.joinedDate,
    required this.favorites,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
      location: json['location'],
      joinedDate: json['joinedDate'],
      favorites: List<String>.from(json['favorites'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'location': location,
      'joinedDate': joinedDate,
      'favorites': favorites,
    };
  }
}
