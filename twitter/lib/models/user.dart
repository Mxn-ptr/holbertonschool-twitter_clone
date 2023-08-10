class User {
  String? key;
  String? userID;
  String? email;
  String? userName;
  String? displayName;
  String? imageUrl;
  int followers = 0;
  int following = 0;
  List<String>? followersList = [];
  List<String>? followingList = [];

  User({
    required this.key,
    this.userID,
    required this.email,
    this.userName,
    this.displayName,
    this.imageUrl,
    this.followers = 0,
    this.following = 0,
    this.followersList,
    this.followingList
  });

  User.fromJson(Map<String, dynamic> map)
      : key = map['key'],
        userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        displayName = map['displayName'],
        imageUrl = map['imageUrl'],
        followers = map['followers'],
        following = map['following'],
        followersList = List<String>.from(map['followersList']),
        followingList = List<String>.from(map['followingList']);

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'userID': userID,
      'email': email,
      'userName': userName,
      'displayName': displayName,
      'imageUrl': imageUrl,
      'followers': followers,
      'following': following,
      'followersList': followersList,
      'followingList': followingList,
    };
  }
}
