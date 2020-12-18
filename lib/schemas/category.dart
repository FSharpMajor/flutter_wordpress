import 'links.dart';

class Category {
  int id;
  int count;
  String description;
  String link;
  String name;
  String slug;
  String taxonomy;
  int parent;
//  List<Null> meta;
  Links lLinks;

  // @TAK
  int thumbnailId;

  Category(
      {this.id,
      this.count,
      this.description,
      this.link,
      this.name,
      this.slug,
      this.taxonomy,
      this.parent,
//        this.meta,
      this.lLinks,
      // @TAK
      this.thumbnailId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    description = json['description'];
    link = json['link'];
    name = json['name'];
    slug = json['slug'];
    taxonomy = json['taxonomy'];
    parent = json['parent'];
    /*if (json['meta'] != null) {
      meta = new List<Null>();
      json['meta'].forEach((v) {
        meta.add(new Null.fromJson(v));
      });
    }*/
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    thumbnailId = json['meta'] != null
        ? (json['meta']['_pciwgas_cat_thumb_id'] != null
            ? int.parse(json['meta']['_pciwgas_cat_thumb_id'][0])
            : null)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    data['description'] = this.description;
    data['link'] = this.link;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['taxonomy'] = this.taxonomy;
    data['parent'] = this.parent;
    /*if (this.meta != null) {
      data['meta'] = this.meta.map((v) => v.toJson()).toList();
    }*/
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    if (this.thumbnailId != null) {
      data['meta']['_pciwgas_cat_thumb_id'][0] = this.thumbnailId.toString();
    }
    return data;
  }
}
