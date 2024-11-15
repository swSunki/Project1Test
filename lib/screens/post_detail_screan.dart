import 'package:c5_test/models/post.dart';
import 'package:c5_test/screens/post_edit_screen.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post; // 전달받은 게시글 데이터

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostEditScreen(
                    post: post,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 게시물 이미지
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                post.images.isNotEmpty
                    ? post.images[0]
                    : 'https://example.com/placeholder.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // 제목 및 가격
            Text(
              post.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${post.price}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 8),

            // 상태 (판매 중, 예약 중, 판매 완료)
            Text(
              post.status,
              style: TextStyle(
                fontSize: 16,
                color: post.status == '판매 중'
                    ? Colors.blue
                    : post.status == '예약 중'
                        ? Colors.orange
                        : Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // 설명
            const Text(
              '설명',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              post.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // 댓글 섹션
            const Text(
              '댓글',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CommentSection(postId: post.postId), // 댓글 섹션 위젯 호출
          ],
        ),
      ),
    );
  }
}

// 댓글 섹션 위젯
class CommentSection extends StatefulWidget {
  final String postId; // 게시글 ID

  const CommentSection({super.key, required this.postId});

  @override
  // ignore: library_private_types_in_public_api
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();
  List<Map<String, String>> comments = []; // Mock 데이터로 댓글 리스트 구성

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        comments.add({
          'user': 'User', // 임시 사용자 이름
          'content': _commentController.text,
        });
        _commentController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('댓글이 추가되었습니다!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 댓글 입력창
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  labelText: '댓글 입력',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: _addComment,
            ),
          ],
        ),
        const SizedBox(height: 16),

        // 댓글 리스트
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Text(comments[index]['user']![0])),
              title: Text(comments[index]['user']!),
              subtitle: Text(comments[index]['content']!),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
