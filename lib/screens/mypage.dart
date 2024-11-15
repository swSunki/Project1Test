import 'package:c5_test/mock_datas.dart';
import 'package:c5_test/models/post.dart';
import 'package:c5_test/widgets/post_item.dart';
import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  const Mypage({
    super.key,
  });

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  final post = mockPosts;
  final bookmarkedPost = mockBookmarkedPosts;
  final user = mockUser;
  String selectedCategory = 'sales'; // 초기 선택값을 '판매 목록'으로 설정
  List<Post> displayedPosts = [];

  @override
  void initState() {
    super.initState();
    // 초기 상태에 따라 판매 목록을 기본으로 표시
    displayedPosts = mockPosts;
  }

  void _updateDisplayedPosts(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'sales') {
        displayedPosts = mockPosts; //추후 salesPosts;
      } else if (category == 'purchases') {
        displayedPosts = mockPosts; // 추후 purchasePosts;
      } else if (category == 'bookmarks') {
        displayedPosts = bookmarkedPost; // 추후 bookmarkPosts;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 북마크 및 판매목록 그리드 (하단 구현 예정)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.profileImage),
                onBackgroundImageError: (_, __) => const Icon(Icons.person),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
        // 판매목록, 구매목록, 북마크 선택 버튼
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => _updateDisplayedPosts('sales'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedCategory == 'sales' ? Colors.blue : Colors.grey,
                ),
                child: const Text('판매목록'),
              ),
              ElevatedButton(
                onPressed: () => _updateDisplayedPosts('purchases'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedCategory == 'purchases'
                      ? Colors.blue
                      : Colors.grey,
                ),
                child: const Text('구매목록'),
              ),
              ElevatedButton(
                onPressed: () => _updateDisplayedPosts('bookmarks'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedCategory == 'bookmarks'
                      ? Colors.blue
                      : Colors.grey,
                ),
                child: const Text('북마크'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // 선택된 목록의 그리드 표시
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: displayedPosts.length,
            itemBuilder: (context, index) {
              return PostItem(post: displayedPosts[index]);
            },
          ),
        ),
      ],
    );
  }
}
