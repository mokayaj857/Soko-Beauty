class User {
  String userId;
  String username;
  String email;
  String fullName;
  String phoneNumber;
  String profileImage;
  bool isVendor;
  List<String> shops; // List of shop IDs associated with the user
  List<String> videos; // List of video IDs associated with the user
  List<String> cards; // List of card IDs associated with the user
  DateTime registrationDate;

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.profileImage,
    required this.isVendor,
    required this.shops,
    required this.videos,
    required this.cards,
    required this.registrationDate,
  });
}
