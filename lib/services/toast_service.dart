import 'package:fluttertoast/fluttertoast.dart';
import 'package:notifyme/core/theme/app_pallete.dart';

class ToastService {
  ToastService._();
  static showSuccessSnackbar(String text) {
    Fluttertoast.showToast(
      msg: 'Coming soon...',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: AppPallete.green,
      textColor: AppPallete.white,
      fontSize: 16.0,
    );
  }
}
