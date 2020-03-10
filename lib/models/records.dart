class Records {
  int id;
  String name;
  String lastResult;
  int testCount;

  Records({
    this.id,
    this.lastResult,
    this.name,
    this.testCount,
  });

  Records.map(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];
    this.lastResult = obj['lastResult'];
    this.testCount = obj['testCount'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["id"] = this.id;
    map["name"] = this.name;
    map["lastResult"] = this.lastResult;
    map["testCount"] = this.testCount;

    return map;
  }
}
