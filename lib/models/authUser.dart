class AuthUser {
  String username;
  String password;

  AuthUser({
    this.password,
    this.username,
  });

  AuthUser.map(dynamic obj) {
    this.username = obj['userName'];
    this.password = obj['password'];
  }

  //Creating the data toMap
  Map<String, dynamic> toMap() {
    // var map = new Map<String, dynamic>();

    // map["userName"] = this.username;
    // map["password"] = this.password;

    // return map;
    return {"userName": username, "password": password};
  }

  AuthUser.fromMap(Map<String, dynamic> map) {
    this.username = map["userName"];
    this.password = map["password"];
  }
}

class Token {
  int id;
  String auth;
  String token;

  Token({this.id, this.auth, this.token});
  // Token({this.id, this.token});

  Token.fromJson(Map<String, dynamic> map) {
    this.id = map["id"];
    this.auth = map["auth"];
    this.token = map["token"];
  }
  //Creating the data toMap
  Map<String, dynamic> toJson() {
    // var map = new Map<String, dynamic>();
    return {"id": id, "auth": auth, "token": token};
    // return {"id": id, "token": token};
    // return map;
  }
}
