
class EndpointEntity {

  final Map<dynamic, dynamic> headers;
  final String href;
  final String method;
  final bool templated;
  final int timeout;
  final int ttl;

  EndpointEntity({
    this.headers,
    this.href,
    this.method,
    this.templated,
    this.timeout,
    this.ttl
  });

  factory EndpointEntity.fromJson(Map<String, dynamic> json) {
    return EndpointEntity(
      headers: json['headers'],
      href: json['href'],
      method: json['method'],
      templated: json['templated'],
      timeout: json['timeout'],
      ttl: json['ttl']
    );
  }

}

class ClientEntity {
  
  final String baseUrl;
  final Map<dynamic, dynamic> endpoints;

  ClientEntity({this.baseUrl, this.endpoints});

  factory ClientEntity.fromJson(Map<String, dynamic> json) {
    return ClientEntity(
      baseUrl: json['baseUrl'],
      endpoints: json['endpoints']
    );
  }

}

class ServiceEntity {
  
  final ClientEntity client;
  final bool disabled;
  final dynamic extras;

  ServiceEntity({this.client, this.disabled, this.extras});

  factory ServiceEntity.fromJson(Map<String, dynamic> json) {
    return ServiceEntity(
      client: ClientEntity.fromJson(json['client']),
      disabled: json['disabled'],
      extras: json['extras']
    );
  }

}