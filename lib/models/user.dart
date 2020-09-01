class User {
  User(
      {this.uid,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.gender,
      this.dateOfBirth,
      this.address,
      this.avatar,
      this.cover});

  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final int gender;
  final DateTime dateOfBirth;
  final String address;
  final String avatar;
  final String cover;
}
