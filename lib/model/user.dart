class User {
  String id;
  String firstName;
  String lastName;
  String fullName;
  String email;
  String birthDate;
  String profilePhoto;
  List<String> friendIds;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.email,
        this.birthDate,
        this.profilePhoto,
        this.friendIds});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    fullName = json['FullName'];
    email = json['Email'];
    birthDate = json['BirthDate'];
    profilePhoto = json['ProfilePhoto'];
    friendIds = json['FriendIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['FullName'] = this.fullName;
    data['Email'] = this.email;
    data['BirthDate'] = this.birthDate;
    data['ProfilePhoto'] = this.profilePhoto;
    data['FriendIds'] = this.friendIds;
    return data;
  }
}