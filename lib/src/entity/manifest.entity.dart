
class __ApplicationEntiry {

  final String id;
  final String name;

  __ApplicationEntiry({this.id, this.name});

  factory __ApplicationEntiry.fromJson(Map<String, dynamic> json) {
    return __ApplicationEntiry(
      id: json['id'],
      name: json['name'],
    );
  }

}

class __CommonHeaders {
  final String clientID;
  final String platformVersion;
  final String version;

  __CommonHeaders({this.clientID, this.platformVersion, this.version});

  factory __CommonHeaders.fromJson(Map<String, dynamic> json) {
    return __CommonHeaders(
      clientID: json['X-BAMSDK-Client-ID'],
      platformVersion: json['X-BAMSDK-Platform'],
      version: json['X-BAMSDK-Version'],
    );
  }

}

class __Logger {
  final String logLevel;
  __Logger({this.logLevel});
  factory __Logger.fromJson(Map<String, dynamic> json) {
    return __Logger(
      logLevel: json['logLevel'],
    );
  }
}

class ManifestEntity {

  final __ApplicationEntiry application;
  final __CommonHeaders commonHeaders;
  final __Logger logger;
  final Map<dynamic, dynamic> services;

  ManifestEntity({this.application, this.commonHeaders, this.logger, this.services});

  factory ManifestEntity.fromJson(Map<String, dynamic> json) {
    return ManifestEntity(
      application: __ApplicationEntiry.fromJson(json['application']),
      commonHeaders: __CommonHeaders.fromJson(json['commonHeaders']),
      logger: __Logger.fromJson(json['logger']),
      services: json['services']
    );
  }

}