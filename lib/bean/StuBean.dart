class StuBean {
  int code;
  String info;
  List<Results> results;

  StuBean({this.code, this.info, this.results});

  StuBean.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['info'] = this.info;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String stuNum;
  String name;
  String sex;
  String classNum;
  String major;
  String academy;
  String grade;
  String birthday;
  String photoUrl;

  Results(
      {this.stuNum,
        this.name,
        this.sex,
        this.classNum,
        this.major,
        this.academy,
        this.grade,
        this.birthday,
        this.photoUrl});

  Results.fromJson(Map<String, dynamic> json) {
    stuNum = json['stuNum'];
    name = json['name'];
    sex = json['sex'];
    classNum = json['classNum'];
    major = json['major'];
    academy = json['academy'];
    grade = json['grade'];
    birthday = json['birthday'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stuNum'] = this.stuNum;
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['classNum'] = this.classNum;
    data['major'] = this.major;
    data['academy'] = this.academy;
    data['grade'] = this.grade;
    data['birthday'] = this.birthday;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}