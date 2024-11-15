import 'package:c5_test/mock_datas.dart';
import 'package:c5_test/models/post.dart';
import 'package:c5_test/widgets/post_item.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final posts = mockPosts;
  List<Post> _searchResults = []; // 검색 결과 목록

  void _performSearch(String query) {
    setState(() {
      // 검색어가 포함된 게시물 필터링
      _searchResults = posts.where((post) {
        final titleLower = post.title.toLowerCase();
        final queryLower = query.toLowerCase();
        return titleLower.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 검색 입력 필드
        TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            labelText: 'Search...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: _performSearch, // 검색어 입력 시 검색 수행
        ),
        const SizedBox(height: 16),
        // 검색 결과 GridView
        Expanded(
          child: _searchResults.isEmpty
              ? const Center(child: Text('No results found'))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    return PostItem(post: _searchResults[index]);
                  },
                ),
        ),
      ],
    );
  }
}
