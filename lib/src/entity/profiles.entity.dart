class SubtitleEntity {
  final String backgroundColor;
  final int backgroundOpacity;
  final String description;
  final String font;
  final String size;
  final String textColor;

  SubtitleEntity({
    this.backgroundColor,
    this.backgroundOpacity,
    this.description,
    this.font,
    this.size,
    this.textColor
  });

  factory SubtitleEntity.fromJson(Map<String, dynamic> json) {

    return SubtitleEntity (
      backgroundColor: json["backgroundColor"],
      backgroundOpacity: json["backgroundOpacity"],
      description: json["description"],
      font: json["font"],
      size: json["size"],
      textColor: json["textColor"]
    );

  }

}

class PlaybackEntity {
  final bool autoplay;
  final bool backgroundVideo;
  final bool previewAudioOnHome;
  final bool previewVideoOnHome;

  PlaybackEntity({
    this.autoplay,
    this.backgroundVideo,
    this.previewAudioOnHome,
    this.previewVideoOnHome
  });

  factory PlaybackEntity.fromJson(Map<String, dynamic> json) {

    return PlaybackEntity(
      autoplay: json["autoplay"],
      backgroundVideo: json["backgroundVideo"],
      previewAudioOnHome: json["previewAudioOnHome"],
      previewVideoOnHome: json["previewVideoOnHome"]
    );

  }

}

class AvatarEntity {
  final String id;
  final bool userSelected;

  AvatarEntity({
    this.id,
    this.userSelected
  });

  factory AvatarEntity.fromJson(Map<String, dynamic> json) {
    return AvatarEntity(
      id: json["id"],
      userSelected: json["userSelected"]
    );
  }

}

class LanguageEntity {
  final String appLanguage;
  final String playbackLanguage;
  final bool preferAudioDescription;
  final bool preferSDH;
  final SubtitleEntity subtitleAppearance;
  final String subtitleLanguage;
  final bool subtitlesEnabled;

  LanguageEntity({
    this.appLanguage,
    this.playbackLanguage,
    this.preferAudioDescription,
    this.preferSDH,
    this.subtitleAppearance,
    this.subtitleLanguage,
    this.subtitlesEnabled
   });

  factory LanguageEntity.fromJson(Map<String, dynamic> json) {
    return LanguageEntity(
      appLanguage: json["appLanguage"],
      playbackLanguage: json["playbackLanguage"],
      preferAudioDescription: json["preferAudioDescription"],
      preferSDH: json["preferSDH"],
      subtitleAppearance: SubtitleEntity.fromJson(json["subtitleAppearance"]),
      subtitleLanguage: json["subtitleLanguage"],
      subtitlesEnabled: json["subtitlesEnabled"]
    );

  }

}

class AttributesEntity {
  final bool isDefault;
  final bool kidsModeEnabled;
  final LanguageEntity languagePreferences;
  final AvatarEntity avatar;
  final PlaybackEntity playbackSettings;

  AttributesEntity({
    this.isDefault,
    this.kidsModeEnabled,
    this.languagePreferences,
    this.avatar,
    this.playbackSettings
  });

  factory AttributesEntity.fromJson(Map<String, dynamic> json) {
    return AttributesEntity(
      isDefault: json["isDefault"],
      kidsModeEnabled: json["kidsModeEnabled"],
      languagePreferences: LanguageEntity.fromJson(json["languagePreferences"]),
      avatar: AvatarEntity.fromJson(json["avatar"]),
      playbackSettings: PlaybackEntity.fromJson(json["playbackSettings"])
    );
  }

}

class ProfileEntity {
  final String profileName;
  final String partner;
  final String profileId;
  final AttributesEntity attributes;

  ProfileEntity({
    this.profileName,
    this.partner,
    this.profileId,
    this.attributes
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      profileName: json["profileName"],
      partner: json["partner"],
      profileId: json["profileId"],
      attributes: AttributesEntity.fromJson(json["attributes"])
    );
  }

}