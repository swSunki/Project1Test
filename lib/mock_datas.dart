import 'package:c5_test/models/post.dart';
import 'package:c5_test/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<Post> mockPosts = [
  Post(
    postId: 'post_001',
    title: 'Used iPhone 13',
    description: 'Good condition, barely used. Includes box and accessories.',
    price: 650,
    category: 'Electronics',
    images: [
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg',
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg',
    ],
    sellerId: 'user_001',
    location: const GeoPoint(37.7749, -122.4194),
    status: '판매 중',
    createdAt:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 1))),
    favoritesCount: 12,
  ),
  Post(
    postId: 'post_002',
    title: 'Mountain Bike',
    description: 'Lightly used mountain bike, perfect for trail rides.',
    price: 300,
    category: 'Sports',
    images: [
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg',
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg',
    ],
    sellerId: 'user_002',
    location: const GeoPoint(34.0522, -118.2437),
    status: '예약 중',
    createdAt:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 3))),
    favoritesCount: 8,
  ),
  Post(
    postId: 'post_003',
    title: 'Wooden Bookshelf',
    description: 'Solid wood bookshelf, holds up to 100 books.',
    price: 120,
    category: 'Furniture',
    images: [
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg'
    ],
    sellerId: 'user_003',
    location: GeoPoint(40.7128, -74.0060),
    status: '판매 중',
    createdAt: Timestamp.fromDate(DateTime.now().subtract(Duration(days: 2))),
    favoritesCount: 15,
  ),
  Post(
    postId: 'post_004',
    title: 'Sony Headphones',
    description: 'Noise-canceling headphones, excellent sound quality.',
    price: 150,
    category: 'Electronics',
    images: [
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg'
    ],
    sellerId: 'user_004',
    location: GeoPoint(51.5074, -0.1278),
    status: '판매 완료',
    createdAt: Timestamp.fromDate(DateTime.now().subtract(Duration(days: 5))),
    favoritesCount: 20,
  ),
  Post(
    postId: 'post_005',
    title: 'Gaming Chair',
    description: 'Ergonomic gaming chair, adjustable height and recline.',
    price: 180,
    category: 'Furniture',
    images: [
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg',
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg',
    ],
    sellerId: 'user_005',
    location: const GeoPoint(48.8566, 2.3522),
    status: '판매 중',
    createdAt:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 6))),
    favoritesCount: 10,
  ),
];

User mockUser = User(
  userId: 'user_001',
  name: 'Jane Doe',
  email: 'janedoe@example.com',
  profileImage: 'https://example.com/profile.jpg',
  location: const GeoPoint(37.7749, -122.4194),
  joinedDate: Timestamp.fromDate(DateTime(2022, 1, 1)),
  favorites: ['post_001', 'post_002', 'post_003'],
);

List<Post> mockBookmarkedPosts = [
  Post(
    postId: 'post_004',
    title: 'Sony Headphones',
    description: 'Noise-canceling headphones, excellent sound quality.',
    price: 150,
    category: 'Electronics',
    images: [
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg'
    ],
    sellerId: 'user_004',
    location: const GeoPoint(51.5074, -0.1278),
    status: '판매 완료',
    createdAt:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 5))),
    favoritesCount: 20,
  ),
  Post(
    postId: 'post_005',
    title: 'Gaming Chair',
    description: 'Ergonomic gaming chair, adjustable height and recline.',
    price: 180,
    category: 'Furniture',
    images: [
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg',
      'https://cdn.pixabay.com/photo/2017/07/27/23/00/background-2547097_1280.jpg',
    ],
    sellerId: 'user_005',
    location: const GeoPoint(48.8566, 2.3522),
    status: '판매 중',
    createdAt:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 6))),
    favoritesCount: 10,
  ),
];
