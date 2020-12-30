import 'dart:convert';

import 'package:meta/meta.dart';
import 'content.dart';
import 'title.dart';
import 'package:html_unescape/html_unescape.dart';

/// A [bbPress Topic] by @TAK
class Topic {
  /// ID of the forum
  int id;

  String type;

  /// Forum title
  Title title;

  /// Name of author
  String authorName;

  /// date of posting this topic
  String date;

  /// Forum content
  Content content;

  /// Number of parents
  int parent;

  /// Number of replies under this topic
  int reply_count;

  /// url link
  String permalink;

  /// the id of the forum that the topic belongs to
  int forumId;

  /// the title of the forum that the topic belongs to
  String forumTitle;

  Topic({
    @required String title,
    @required String content,
    @required String authorName,
    this.date,
  })  : this.title = new Title(rendered: title),
        this.content = new Content(rendered: content),
        this.authorName = authorName;

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'] != null
        ? Title(rendered: HtmlUnescape().convert(json['title']))
        : null;
    authorName = json['author_name'];
    date = json['post_date'];
    content =
        json['content'] != null ? new Content(rendered: json['content']) : null;
    parent = json['parent'];
    reply_count = int.parse(json['reply_count']);
    permalink = json['permalink'];
    forumId = json['forum_id'];
    forumTitle = json['forum_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) data['type'] = this.type;
    if (this.title != null)
      data['title'] = HtmlEscape().convert(this.title.rendered);
    if (this.authorName != null) data['author_name'] = this.authorName;
    if (this.date != null) data['post_date'] = this.date;
    if (this.content != null) data['content'] = this.content.rendered;
    if (this.parent != null) data['parent'] = this.parent;
    if (this.reply_count != null) data['reply_count'] = this.reply_count;
    if (this.permalink != null) data['permalink'] = this.permalink;
    if (this.forumId != null) data['forum_id'] = this.forumId;
    if (this.forumTitle != null) data['forum_title'] = this.forumTitle;
    return data;
  }

  @override
  String toString() {
    return 'Forum: { id: $id, title: ${title.rendered}';
  }
}
