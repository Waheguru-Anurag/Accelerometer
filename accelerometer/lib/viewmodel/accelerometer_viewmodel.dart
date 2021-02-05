import 'package:accelerometer/locator.dart';
import 'package:accelerometer/service/accelerometer_service.dart';
import 'package:accelerometer/viewmodel/base_viewmodel.dart';

class AccelerometerViewModel extends BaseViewModel {
  var _accelerometerService = locator<AccelerometerService>();
  Future<void> onModelReady() {
    return null;
  }

  Future<void> shareData(String x, String y, String z) async {
    _accelerometerService.shareData(x, y, z);
    return null;
  }
}
