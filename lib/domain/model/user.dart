class User {
  final String? nickName;

  User({this.nickName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nickName: json['nickName'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nickName': nickName,
      };
}
