class Records {
  int id;
  String student;
  String unique;
  String similar;
  String result;

  Records({
    this.id,
    this.student,
    this.unique,
    this.similar,
    this.result,
  });

  // Records.map(dynamic obj) {
  //   this.id = obj['id'];
  //   this.unique = obj['unique'];
  //   this.student = obj['student'];
  //   this.similar = obj['similar'];
  //   this.result = obj['result'];
  // }

  // Map<String, dynamic> toMap() {
  //   var map = new Map<String, dynamic>();

  //   map["id"] = this.id;
  //   map["unique"] = this.unique;
  //   map["student"] = this.student;
  //   map["similar"] = this.similar;
  //   map["result"] = this.result;

  //   return map;
  // }
}
