import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postId;
  late final String title;
  late final String description;
  late final num price;
  late final String category;
  late final List<String> images;
  final String sellerId;
  final GeoPoint location;
  final String status;
  final Timestamp createdAt;
  final int favoritesCount;

  Post({
    required this.postId,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.images,
    required this.sellerId,
    required this.location,
    required this.status,
    required this.createdAt,
    required this.favoritesCount,
  });

  // factory Post.fromJson(Map<String, dynamic> json) {
  //   return Post(
  //     postId: json['postId'],
  //     title: json['title'],
  //     description: json['description'],
  //     price: json['price'],
  //     category: json['category'],
  //     images: List<String>.from(json['images'] ?? []),
  //     sellerId: json['sellerId'],
  //     location: json['location'],
  //     status: json['status'],
  //     createdAt: json['createdAt'],
  //     favoritesCount: json['favoritesCount'] ?? 0,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'postId': postId,
  //     'title': title,
  //     'description': description,
  //     'price': price,
  //     'category': category,
  //     'images': images,
  //     'sellerId': sellerId,
  //     'location': location,
  //     'status': status,
  //     'createdAt': createdAt,
  //     'favoritesCount': favoritesCount,
  //   };
  // }
}
