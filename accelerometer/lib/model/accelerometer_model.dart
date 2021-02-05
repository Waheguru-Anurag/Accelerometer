// To parse this JSON data, do
//
//     final accelerometerModel = accelerometerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AccelerometerModel accelerometerModelFromJson(String str) =>
    AccelerometerModel.fromJson(json.decode(str));

String accelerometerModelToJson(AccelerometerModel data) =>
    json.encode(data.toJson());

class AccelerometerModel {
  AccelerometerModel({
    @required this.accelerationX,
    @required this.accelerationY,
    @required this.accelerationZ,
  });

  String accelerationX;
  String accelerationY;
  String accelerationZ;

  factory AccelerometerModel.fromJson(Map<String, dynamic> json) =>
      AccelerometerModel(
        accelerationX:
            json["accelerationX"] == null ? null : json["accelerationX"],
        accelerationY:
            json["accelerationY"] == null ? null : json["accelerationY"],
        accelerationZ:
            json["accelerationZ"] == null ? null : json["accelerationZ"],
      );

  Map<String, dynamic> toJson() => {
        "accelerationX": accelerationX == null ? null : accelerationX,
        "accelerationY": accelerationY == null ? null : accelerationY,
        "accelerationZ": accelerationZ == null ? null : accelerationZ,
      };
}
