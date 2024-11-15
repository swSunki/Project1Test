import 'package:cloud_firestore/cloud_firestore.dart';

String timeAgo(Timestamp timestamp) {
  final now = DateTime.now();
  final createdDate = timestamp.toDate();
  final difference = now.difference(createdDate);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds}초 전';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}분 전';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}시간 전';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}일 전';
  } else if (difference.inDays < 30) {
    return '${(difference.inDays / 7).floor()}주 전';
  } else if (difference.inDays < 365) {
    return '${(difference.inDays / 30).floor()}개월 전';
  } else {
    return '${(difference.inDays / 365).floor()}년 전';
  }
}
