class User {
  final String userFirstname;
  final String userLastname;
  final String userEmail;
  final String userPhone;
  final String userPassword;
  final String userCity;
  final String userZipcode;

  User({
    required this.userFirstname,
    required this.userLastname,
    required this.userEmail,
    required this.userPhone,
    required this.userPassword,
    required this.userCity,
    required this.userZipcode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userFirstname: json['user_firstname'],
      userLastname: json['user_lastname'],
      userEmail: json['user_email'],
      userPhone: json['user_phone'],
      userPassword: json['user_password'],
      userCity: json['user_city'],
      userZipcode: json['user_zipcode'],
    );
  }
}
