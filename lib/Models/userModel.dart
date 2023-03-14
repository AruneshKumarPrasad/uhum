


class UserModel {
late  String firstName;
late  String lastName;
late  String email;
late  String profilePictureUrl;
late  String level;
late  String currentExperience;
late  String uId;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profilePictureUrl,
    required this.level,
    required this.currentExperience,
    required this.uId
  });

  UserModel.fromJson(Map<String,dynamic> json){

    firstName = json['firstName'];
    lastName = json['lastName'];
  email = json['email']; 
  uId = json['uId'];
  profilePictureUrl = json['profilePictureUrl'];
  level = json['level'];
  currentExperience = json['currentExperience'];
}

Map<String,dynamic> toMap(){
 return {
firstName:'firstName',
  lastName:'lastName',
  email:'email',
  uId:'uId',
  profilePictureUrl :'profilePictureUrl',
  level:'level' ,
  currentExperience : 'currentExperience',
  };
}

}




