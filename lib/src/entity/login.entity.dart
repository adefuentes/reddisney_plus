
class LoginEntity {

  final String tokenType;
  final String idToken;
  final int expiresIn;

  LoginEntity({this.tokenType, this.idToken, this.expiresIn});

  factory LoginEntity.fromJson(Map<String, dynamic> json) {
    return LoginEntity(
      tokenType: json["token_type"],
      idToken: json["id_token"],
      expiresIn: json["expires_in"]
    );
  }

}