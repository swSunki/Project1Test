import 'package:c5_test/mock_datas.dart';
import 'package:c5_test/models/post.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PostUploadScreen extends StatefulWidget {
  const PostUploadScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PostUploadScreenState createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  final posts = mockPosts;

  void _addMockPost() {
    if (_formKey.currentState!.validate()) {
      final newPost = Post(
        postId: 'post_${mockPosts.length + 1}',
        title: _titleController.text,
        description: _descriptionController.text,
        price: num.tryParse(_priceController.text) ?? 0,
        category: _categoryController.text,
        images: [
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/assets%2FDefaultImage.png?alt=media&token=bac50693-0a69-4d60-90d9-3b92883ae9c0'
        ],
        sellerId: 'user_001',
        location: const GeoPoint(37.7749, -122.4194), // 임시 위치 값
        status: '판매 중',
        createdAt: Timestamp.now(),
        favoritesCount: 0,
      );

      setState(() {
        mockPosts.add(newPost);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('게시글이 Mock 데이터에 추가되었습니다!')),
      );

      _titleController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _categoryController.clear();
      _imageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: '제목'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: '설명'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '설명을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: '가격'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '가격을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: '카테고리'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '카테고리를 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addMockPost,
                child: const Text('게시글 추가'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _imageController.dispose();
    super.dispose();
  }
}
