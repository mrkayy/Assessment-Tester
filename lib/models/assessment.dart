class Assessment {
  int id;
  int unique;
  int similarity;
  String result;
  List<Map<String, dynamic>> uniqueSections;
  List<Map<String, dynamic>> similarSections;

  Assessment({
    this.id,
    this.unique,
    this.result,
    this.similarity,
    this.similarSections,
    this.uniqueSections,
  });
  Map<String, dynamic> toMap() {
    return {};
  }
}
