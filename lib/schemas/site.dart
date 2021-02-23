class Site {
  int blog_id;
  String domain;
  String path;
  int site_id;
  String registered;
  String last_updated;
  bool public;
  bool archived;
  bool mature;
  bool spam;
  bool deleted;
  int lang_id;
  String site_name;

  Site(
      {this.blog_id,
      this.domain,
      this.path,
      this.site_id,
      this.registered,
      this.last_updated,
      this.public,
      this.archived,
      this.mature,
      this.spam,
      this.deleted,
      this.lang_id,
      this.site_name});

  Site.fromJson(Map<String, dynamic> json) {
    blog_id = int.parse(json['blog_id']);
    domain = json['domain'];
    path = json['path'];
    site_id = int.parse(json['site_id']);
    registered = json['registered'];
    last_updated = json['last_updated'];
    public = json['public'] == '1';
    archived = json['archived'] == '1';
    mature = json['mature'] == '1';
    spam = json['spam'] == '1';
    deleted = json['deleted'] == '1';
    lang_id = int.parse(json['lang_id']);
    site_name = json['site_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blog_id.toString();
    data['domain'] = this.domain;
    data['path'] = this.path;
    data['site_id'] = this.site_id.toString();
    data['registered'] = this.registered;
    data['last_updated'] = this.last_updated;
    data['public'] = this.public ? '1' : '0';
    data['archived'] = this.archived ? '1' : '0';
    data['mature'] = this.mature ? '1' : '0';
    data['spam'] = this.spam ? '1' : '0';
    data['deleted'] = this.deleted ? '1' : '0';
    data['lang_id'] = this.lang_id.toString();
    data['site_name'] = this.site_name;
    return data;
  }
}
