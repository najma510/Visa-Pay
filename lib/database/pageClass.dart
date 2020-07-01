class PageChecker {
  int id, page;

  PageChecker({this.page, this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'page': page,
      'id':id,
    };
    return map;
  }

  PageChecker.fromMap(Map<String, dynamic> map) {
    page = map['page'];
    id = map['id'];
  }
}
