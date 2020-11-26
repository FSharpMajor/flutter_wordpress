import 'package:meta/meta.dart';
import 'content.dart';
import 'title.dart';

/// A [bbPress Forum] by @TAK
class Forum {
  /// ID of the forum
  int id;

  String type;

  /// Forum title
  Title title;

  /// Forum content
  Content content;

  /// Number of parents
  int parent;

  /// Number of topics under this forum
  int topic_count;

  /// Number of replies under this forum
  int reply_count;

  Forum({
    @required String title,
    @required String content,
  })  : this.title = new Title(rendered: title),
        this.content = new Content(rendered: content);

  Forum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'] != null ? Title(rendered: json['title']) : null;
    content =
        json['content'] != null ? new Content(rendered: json['content']) : null;
    parent = json['parent'];
    topic_count = int.parse(json['topic_count']);
    reply_count = int.parse(json['reply_count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) data['type'] = this.type;
    if (this.title != null) data['title'] = this.title.rendered;
    if (this.content != null) data['content'] = this.content.rendered;
    if (this.parent != null) data['parent'] = this.parent;
    if (this.topic_count != null) data['topic_count'] = this.topic_count;
    if (this.reply_count != null) data['reply_count'] = this.reply_count;
    return data;
  }

  @override
  String toString() {
    return 'Forum: { id: $id, title: ${title.rendered}';
  }
}
