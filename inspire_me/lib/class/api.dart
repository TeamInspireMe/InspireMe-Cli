class Api<T> {
  int status;
  T data;
  Meta meta;

  factory Api.fromJson(Map<String, dynamic> json){

  }
}

class Meta {
  String token;
}
