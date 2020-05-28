import 'dart:core';

class Room {
  num value;

  Room ({this.value});

  factory Room.fromJson (dynamic json) {
    return Room(
      value: json['value'],
    );
  }

  num getValue() {
    return value;
  }
}