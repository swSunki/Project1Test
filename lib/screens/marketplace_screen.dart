import 'package:c5_test/mock_datas.dart';
import 'package:c5_test/screens/post_detail_screan.dart';
import 'package:c5_test/widgets/post_item.dart';
import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  MarketplaceScreen({super.key});

  final posts = mockPosts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(
                    post: posts[index],
                  ),
                ),
              );
            },
            child: PostItem(post: posts[index]));
      },
    );
  }
}


