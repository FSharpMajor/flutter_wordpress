import 'package:flutter_wordpress/schemas/bbp_reply.dart';
import 'package:meta/meta.dart';

/// This class is used to store reply as a hierarchy.
class ReplyHierarchy {
  /// Parent reply.
  final Reply reply;

  /// Replies to the parent comment.
  final List<ReplyHierarchy> children;

  ReplyHierarchy({@required this.reply, this.children});

  @override
  String toString() {
    return '$reply, children: [$children]';
  }
}
