class User {
  int id;
  String name;

  User({this.id = 0, this.name = 'Nam'});
  
  // ignore: non_constant_identifier_names, avoid_print
  void PrintInfo() => print('$id - $name');
}
