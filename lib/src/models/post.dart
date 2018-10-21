import 'package:meta/meta.dart';

class Post {
  final String id;
  final String message;
  final String authorName;
  final String reference;
  final String category; //enum ?
  final String lang; //enum ?
  final DateTime createdAt;
  final bool isVisible;
  final int reports;
  final int likes;

  const Post({
    this.id = "",
    @required this.message,
    this.authorName = "",
    this.reference = "",
    this.category = "",
    this.lang = "fr",
    this.isVisible = true,
    this.likes = 0,
    this.reports = 0,
    this.createdAt,
  }) : assert(message != null);
}
