import 'package:accelerometer/locator.dart';
import 'package:accelerometer/service/navigation_service.dart';
import 'package:accelerometer/ui/view/accelerometer_view.dart';
import 'package:accelerometer/viewmodel/base_viewmodel.dart';

class StartUpViewModel extends BaseViewModel {
  var _navigationService = locator<NavigationService>();
  Future<void> onModelReady() async {
    await Future.delayed(Duration(seconds: 2));
    await _navigationService.pushNamedAndRemoveUntil(AccelerometerView.id);
    return null;
  }
}
