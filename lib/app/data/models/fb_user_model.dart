class FbUser {
  String? id;
  String? password;
  String? name;
  String? position;
  String? department;

  FbUser({this.id, this.password, this.name, this.position, this.department});

  FbUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    name = json['name'];
    position = json['position'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['name'] = name;
    data['position'] = position;
    data['department'] = department;
    return data;
  }
}
