import 'package:flutter_wordpress/schemas/tag.dart';
import 'package:meta/meta.dart';
import 'content.dart';

/// A [BBPress Reply] by @TAk
class Reply {
  /// ID of the reply.
  int id;

  /// title of reply
  String title;

  String permalink;

  /// id and title of topic the reply is under
  int topic_id;
  String topic_title;

  int forum_id;

  /// list of tags assigned to reply
  List<Tag> tags;

  Content content;

  /// id of reply that its replying to, 0 if replying to topic
  int reply_to;

  // Author info
  String author_name;
  String email;
  String author_avatar;

  String post_date;

  Reply({
    this.id,
    @required this.topic_id,
    @required String content,
    @required this.reply_to,
    this.title,
    this.permalink,
    this.topic_title,
    this.forum_id,
    this.tags,
    this.author_name,
    this.email,
    this.author_avatar,
  }) : content = new Content(rendered: content);

  Reply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    permalink = json['permalink'];
    topic_id = json['topic_id'];
    topic_title = json['topic_title'];
    forum_id = json['forum_id'];
    content = new Content(rendered: json['content']);
    reply_to = json['reply_to'];
    author_name = json['author_name'];
    email = json['email'];
    author_avatar = json['author_avatar'];
    post_date = json['post_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.id != null) {
      data['id'] = this.id.toString();
    }
    if (this.title != null) {
      data['title'] = this.title.toString();
    }
    if (this.permalink != null) {
      data['permalink'] = this.permalink.toString();
    }
    if (this.topic_id != null) {
      data['topic_id'] = this.topic_id.toString();
    }
    if (this.topic_title != null) {
      data['topic_title'] = this.topic_title;
    }
    if (this.forum_id != null) {
      data['forum_id'] = this.forum_id;
    }
    if (this.tags != null) {
      // data['tags'] = this.tags;
    }
    if (this.content != null) {
      data['content'] = this.content.rendered.toString();
    }
    if (this.author_name != null) data['author_name'] = this.author_name;
    if (this.email != null) data['email'] = this.email;
    return data;
  }

  @override
  String toString() {
    return 'Reply: {id: $id, topic title: $topic_title}';
  }
}
