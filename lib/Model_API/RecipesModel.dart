class RecipesModel {
  String? method;
  bool? status;
  List<Results>? results;

  RecipesModel({this.method, this.status, this.results});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? title;
  String? thumb;
  String? key;
  String? times;
  String? serving;
  String? difficulty;

  Results(
      {this.title,
        this.thumb,
        this.key,
        this.times,
        this.serving,
        this.difficulty});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    key = json['key'];
    times = json['times'];
    serving = json['serving'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumb'] = this.thumb;
    data['key'] = this.key;
    data['times'] = this.times;
    data['serving'] = this.serving;
    data['difficulty'] = this.difficulty;
    return data;
  }
}
