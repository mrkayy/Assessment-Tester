class Students {
  int id;
  String name;
  String lastResult;
  int testCount;

  Students({this.id, this.name, this.lastResult, this.testCount});

  Students.map(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];
    this.lastResult = obj['lastResult'];
    this.testCount = obj['testCount'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    // map["id"] = this.id;
    map["name"] = this.name;
    // map["lastResult"] = this.lastResult;
    // map["testCount"] = this.testCount;

    return map;
  }
}
