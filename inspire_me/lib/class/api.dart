class Api{
  int status;
  Map<String, dynamic> data;
  Meta meta;

  Api({this.status, this.data, this.meta});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      status: json['status'],
      data: json['data'],
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Meta {
  String token;

  Meta({this.token});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      token: json['token'],
    );
  }
}
