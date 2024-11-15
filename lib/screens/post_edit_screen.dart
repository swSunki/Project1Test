import 'package:c5_test/models/post.dart';
import 'package:flutter/material.dart';

class PostEditScreen extends StatefulWidget {
  final Post post; // 수정할 게시물

  PostEditScreen({required this.post});

  @override
  _PostEditScreenState createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _categoryController;
  late TextEditingController _imageController;

  @override
  void initState() {
    super.initState();
    // 각 필드의 초기값을 기존 게시물 값으로 설정
    _titleController = TextEditingController(text: widget.post.title);
    _descriptionController =
        TextEditingController(text: widget.post.description);
    _priceController =
        TextEditingController(text: widget.post.price.toString());
    _categoryController = TextEditingController(text: widget.post.category);
    _imageController = TextEditingController(
        text: widget.post.images.isNotEmpty ? widget.post.images[0] : '');
  }

  void _saveChanges() {
    // 게시물 정보 업데이트
    setState(() {
      widget.post.title = _titleController.text;
      widget.post.description = _descriptionController.text;
      widget.post.price =
          num.tryParse(_priceController.text) ?? widget.post.price;
      widget.post.category = _categoryController.text;
      widget.post.images = [_imageController.text];
    });

    // 뒤로 이동
    Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              // 제목 입력 필드
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 8),
              // 설명 입력 필드
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: 8),
              // 가격 입력 필드
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              // 카테고리 입력 필드
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              SizedBox(height: 8),
              // 이미지 URL 입력 필드
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 16),
              // 저장 버튼
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
