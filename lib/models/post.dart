class PostModel {
  int? id;
  int? userId;
  String? title;
  String? body;

  PostModel({this.id, this.userId, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
