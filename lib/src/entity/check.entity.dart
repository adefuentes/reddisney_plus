
class CheckEntity {

  final List<String> operations;

  CheckEntity({this.operations});

  factory CheckEntity.fromJson(Map<String, dynamic> json) {
    return CheckEntity(
      operations: List.from(json["operations"])
    );
  }

}