
class TokenEntity {

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String refreshToken;

  TokenEntity({this.accessToken, this.tokenType, this.expiresIn, this.refreshToken});

  factory TokenEntity.fromJson(Map<String, dynamic> json) {
    return TokenEntity(
      accessToken: json["access_token"],
      tokenType: json["token_type"],
      expiresIn: json["expires_in"],
      refreshToken: json["refresh_token"],
    );
  }

}