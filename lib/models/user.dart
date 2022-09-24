class User {
  int? id;
  String? name;
  String? image;
  String? email;
  String? token;
  User({
    this.image,
    this.id,
    this.name,
    this.token,
    this.email
  });
  factory User.fromJson(Map<String,dynamic>json){
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      image: json['user']['image'],
      email: json['user']['email'],
      token: json['token'],
    );
  }
}
