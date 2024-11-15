import 'package:c5_test/models/post.dart';
import 'package:c5_test/widgets/time_ago.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                post.images.isNotEmpty
                    ? post.images[0]
                    : "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/assets%2FDefaultImage.png?alt=media&token=bac50693-0a69-4d60-90d9-3b92883ae9c0",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${post.price.toString()}',
                  style: const TextStyle(color: Colors.green),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      post.status,
                      style: TextStyle(
                          color: post.status == '판매 중'
                              ? Colors.blue
                              : post.status == '예약 중'
                                  ? Colors.orange
                                  : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      timeAgo(post.createdAt),
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
