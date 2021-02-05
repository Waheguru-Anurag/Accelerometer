import 'package:accelerometer/ui/base_view.dart';
import 'package:accelerometer/viewmodel/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartUpView extends StatefulWidget {
  StartUpViewState createState() => StartUpViewState();
}

class StartUpViewState extends State<StartUpView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
        onModelReady: (model) {
          return model.onModelReady();
        },
        builder: (context, model, child) => Scaffold(
              body: Center(
                  child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/accelerometer-icon.svg",
                  width: ScreenUtil().setWidth(800),
                  height: ScreenUtil().setWidth(800),
                ),
              )),
            ));
  }
}
