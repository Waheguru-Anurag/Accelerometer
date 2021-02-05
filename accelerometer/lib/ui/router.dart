import 'package:accelerometer/ui/view/accelerometer_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AccelerometerView.id:
        return MaterialPageRoute(builder: (_) => AccelerometerView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
