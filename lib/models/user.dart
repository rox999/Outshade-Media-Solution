class UserList {
  List<User> _users = [];

  UserList(this._users);

  List<User> get users => _users;

  set users(List<User> value) {
    _users = value;
  }

  UserList.fromJson(Map<String, dynamic> jsonValue) {
    for (dynamic user in jsonValue['users']) {
      _users.add(User.fromJson(user));
    }
  }
}

class User {
  String _name = "";
  String _id = "";
  String _atype = "";

  User(this._name, this._id, this._atype);

  String get atype => _atype;

  String get id => _id;

  String get name => _name;

  set atype(String value) {
    _atype = value;
  }

  set id(String value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  User.fromJson(Map<String, dynamic> jsonValue) {
    _name = jsonValue['name'] ?? "";
    _id = jsonValue['id'] ?? "";
    _atype = jsonValue['atype'] ?? "";
  }
}
