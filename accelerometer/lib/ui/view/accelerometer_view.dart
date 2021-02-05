import 'package:accelerometer/ui/base_view.dart';
import 'package:accelerometer/viewmodel/accelerometer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sensors/sensors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AccelerometerView extends StatefulWidget {
  static const String id = "AccelerometerViewID";
  @override
  AccelerometerViewState createState() => AccelerometerViewState();
}

class AccelerometerViewState extends State<AccelerometerView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AccelerometerViewModel>(
      onModelReady: (model) {
        model.onModelReady();
      },
      builder: (context, model, child) => StreamBuilder(
        stream: accelerometerEvents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            model.shareData(
                snapshot.data.x.toStringAsFixed(6),
                snapshot.data.y.toStringAsFixed(6),
                snapshot.data.z.toStringAsFixed(6));
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0.0, ScreenUtil().setHeight(120), 0.0, 0.0),
                        child: Container(
                          child: SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: 0,
                                maximum: 200,
                                labelOffset: 30,
                                axisLineStyle: AxisLineStyle(
                                    thicknessUnit: GaugeSizeUnit.factor,
                                    thickness: ScreenUtil().setSp(0.03,
                                        allowFontScalingSelf: true)),
                                majorTickStyle: MajorTickStyle(
                                    length: ScreenUtil()
                                        .setSp(7, allowFontScalingSelf: true),
                                    thickness: ScreenUtil()
                                        .setSp(6, allowFontScalingSelf: true),
                                    color: Colors.black),
                                minorTickStyle: MinorTickStyle(
                                    length: ScreenUtil()
                                        .setSp(4.5, allowFontScalingSelf: true),
                                    thickness: ScreenUtil()
                                        .setSp(4.5, allowFontScalingSelf: true),
                                    color: Colors.black),
                                axisLabelStyle: GaugeTextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil()
                                        .setSp(20, allowFontScalingSelf: true)),
                                ranges: <GaugeRange>[
                                  GaugeRange(
                                      startValue: 0,
                                      endValue: 200,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      startWidth: ScreenUtil().setSp(0.03,
                                          allowFontScalingSelf: true),
                                      endWidth: ScreenUtil().setSp(0.03,
                                          allowFontScalingSelf: true),
                                      gradient: SweepGradient(
                                          colors: const <Color>[
                                            Colors.green,
                                            Colors.yellow,
                                            Colors.red
                                          ],
                                          stops: const <double>[
                                            0.0,
                                            0.5,
                                            1
                                          ]))
                                ],
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                      value: 100,
                                      needleLength: ScreenUtil()
                                          .setSp(2, allowFontScalingSelf: true),
                                      enableAnimation: true,
                                      animationType: AnimationType.ease,
                                      needleStartWidth: ScreenUtil().setSp(1.5,
                                          allowFontScalingSelf: true),
                                      needleEndWidth: ScreenUtil()
                                          .setSp(6, allowFontScalingSelf: true),
                                      needleColor: Colors.red,
                                      knobStyle: KnobStyle(
                                          knobRadius: ScreenUtil().setSp(0.09,
                                              allowFontScalingSelf: true)))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Text(
                        'Accelerometer Data',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                            fontSize: ScreenUtil().setSp(50)),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(100),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Along X',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(42)),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(10),
                          ),
                          Text(
                            '${snapshot.data.x.toStringAsFixed(6)}',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepOrange,
                                fontSize: ScreenUtil().setSp(42)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Along Y',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(42)),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(10),
                          ),
                          Text(
                            '${snapshot.data.y.toStringAsFixed(6)}',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepOrange,
                                fontSize: ScreenUtil().setSp(42)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Along Z',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(42)),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(10),
                          ),
                          Text(
                            '${snapshot.data.z.toStringAsFixed(6)}',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepOrange,
                                fontSize: ScreenUtil().setSp(42)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          value: null,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        Text('Processing'),
                      ]),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
