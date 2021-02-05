import 'dart:io';

import 'package:accelerometer/model/accelerometer_model.dart';
import 'dart:convert';

class AccelerometerService {
  void shareData(String x, String y, String z) async {
    AccelerometerModel model = AccelerometerModel(
        accelerationX: x, accelerationY: y, accelerationZ: z);

    RawDatagramSocket.bind(InternetAddress.anyIPv4, 5010).then((socket) {
      socket.send(Utf8Codec().encode(json.encode(model)),
          InternetAddress('10.0.2.2'), 5010);
      socket.listen((event) {
        if (event == RawSocketEvent.write) {
          socket.close();
          print("signal send");
        }
      });
    });
  }
}
