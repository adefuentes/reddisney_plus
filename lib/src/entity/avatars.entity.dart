class AvatarTextEntity {
  final String field;
  final String type;
  final String language;
  final String content;
  final String sourceEntity;
  final String targetEntity;

  AvatarTextEntity({
    this.field,
    this.type,
    this.language,
    this.content,
    this.sourceEntity,
    this.targetEntity
  });

  factory AvatarTextEntity.fromJson(Map<String, dynamic> json) {
    return AvatarTextEntity(
      field: json["field"],
      type: json["type"],
      language: json["language"],
      content: json["content"],
      sourceEntity: json["sourceEntity"],
      targetEntity: json["targetEntity"]
    );
  }

}

class AvatarImageEntity {
  final double aspectRatio;
  final List<dynamic> locales;
  final int masterHeight;
  final String masterId;
  final int masterWidth;
  final String purpose;
  final dynamic sourceEntity;
  final String url;

  AvatarImageEntity({
    this.aspectRatio,
    this.locales,
    this.masterHeight,
    this.masterId,
    this.masterWidth,
    this.purpose,
    this.sourceEntity,
    this.url
  });

  factory AvatarImageEntity.fromJson(Map<String, dynamic> json) {

    return AvatarImageEntity(
      aspectRatio: json["aspectRatio"],
      locales: new List.from(json["locales"]),
      masterHeight: json["masterHeight"],
      masterId: json["masterId"],
      masterWidth: json["masterWidth"],
      purpose: json["purpose"],
      sourceEntity: json["sourceEntity"],
      url: json["url"]
    );
  }
  
}

class AvatarMetaEntity {
  final int hits;
  final int pageSize;
  final int offset;
  final List<dynamic> errors;

  AvatarMetaEntity({this.hits, this.pageSize, this.offset, this.errors});

  factory AvatarMetaEntity.fromJson(Map<String, dynamic> json) {

    print(json);

    return AvatarMetaEntity(
      hits: json["hits"],
      pageSize: json["pageSize"],
      offset: json["offset"],
      errors: new List.from(json["errors"] ?? [])
    );
  }

}

class AvatarfulyEntity {
  final String type;
  final String avatarId;
  final String encodedAvatarId;
  final String partnerCharacterId;
  final String partnerContextId;
  final String groupingId;
  final List<AvatarImageEntity> images;
  final List<AvatarTextEntity> texts;

  AvatarfulyEntity({
    this.type,
    this.avatarId,
    this.encodedAvatarId,
    this.partnerCharacterId,
    this.partnerContextId,
    this.groupingId,
    this.images,
    this.texts
  });

  factory AvatarfulyEntity.fromJson(Map<String, dynamic> json) {

    var imagesList = json["images"] as List;
    var textsList = json["texts"] as List;

    List<AvatarImageEntity> images = imagesList.map((v) => AvatarImageEntity.fromJson(v)).toList();
    List<AvatarTextEntity> texts = textsList.map((v) => AvatarTextEntity.fromJson(v)).toList();

    return AvatarfulyEntity(
      type: json["type"],
      avatarId: json["avatarId"],
      encodedAvatarId: json["encodedAvatarId"],
      partnerCharacterId: json["partnerCharacterId"],
      partnerContextId: json["partnerContextId"],
      groupingId: json["groupingId"],
      images: images,
      texts: texts
    );
  }

}

class AvatarsDataEntity {
  final List<AvatarfulyEntity> avatars;
  final AvatarMetaEntity meta;

  AvatarsDataEntity({this.avatars, this.meta});

  factory AvatarsDataEntity.fromJson(Map<String, dynamic> json) {

    var avatarsList = json["AvatarByAvatarId"]["avatars"] as List;

    List<AvatarfulyEntity> avatars = avatarsList.map((v) => AvatarfulyEntity.fromJson(v)).toList();

    return AvatarsDataEntity(
      avatars: avatars,
      meta: AvatarMetaEntity.fromJson(json["AvatarByAvatarId"]["meta"])
    );

  }

}