class Factor {
  num value;

  Factor({this.value});

  factory Factor.fromJson(dynamic json) {
    return Factor(value: json['value']);
  }
}