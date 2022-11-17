import 'dart:math';

class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  // CREATE CONSTRUCTOR
  SignUpFormModel(
      {this.name,
      this.email,
      this.password,
      this.pin,
      this.profilePicture,
      this.ktp});

  // CONVERT MODEL TO JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  // FUNCTION COPY WITH
  SignUpFormModel copyWith({
    String? pin,
    String? profilePicture,
    String? ktp,
  }) =>
      SignUpFormModel(
        name: name,
        email: email,
        password: password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );
}
