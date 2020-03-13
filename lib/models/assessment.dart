class Assessment {
  int id;
  int unique;
  int similarity;
  String result;
  List<Map<String, dynamic>> body;

  Assessment({
    this.id,
    this.unique,
    this.result,
    this.similarity,
    this.body,
  });

  factory Assessment.fromJson(Map<String, dynamic> map) {
    return Assessment(
      id: map["id"],
      unique: map["unique"],
      result: map["result"],
      similarity: map["similarity"],
      body: map["body"],
    );
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}
