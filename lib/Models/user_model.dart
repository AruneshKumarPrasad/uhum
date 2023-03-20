class UserModel {
  late String firstName;
  late String lastName;
  late String email;
  late String profilePicture;
  late String level;
  late String currentExperience;
  late String uId;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.profilePicture,
      required this.level,
      required this.currentExperience,
      required this.uId});

  UserModel.fromMap(Map<String, dynamic> map) {
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
    uId = map['uId'];
    profilePicture = map['profilePicture'];
    level = map['level'];
    currentExperience = map['currentExperience'];
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'uId': uId,
      'profilePicture': profilePicture,
      'level': level,
      'currentExperience': currentExperience,
    };
  }
}
