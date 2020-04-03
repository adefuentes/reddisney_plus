
class GrantEntity {

  final String grantType;
  final String assertion;

  GrantEntity({this.grantType, this.assertion});

  factory GrantEntity.fromJson(Map<String, dynamic> json) {
    return GrantEntity(
      grantType: json['grant_type'],
      assertion: json['assertion']
    );
  }

}
