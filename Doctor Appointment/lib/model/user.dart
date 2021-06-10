class User {
  String image;
  String date;
  User({this.image, this.date});

  Map<String, String> toMap(User user) {
    return {
      'image': user.image,
      'date': user.date,
    };
  }

  factory User.fromJson(Map<String, String> userMap) {
    return User(
      image: userMap['image'],
      date: userMap['date'],
    );
  }
}
