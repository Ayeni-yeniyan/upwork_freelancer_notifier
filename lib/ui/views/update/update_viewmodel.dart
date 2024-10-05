import 'package:notifyme/app/app.router.dart';
import 'package:notifyme/init_dependencies.dart';
import 'package:notifyme/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UpdateViewModel extends BaseViewModel {
  final ApiService _repo;
  final _navigator = locator<NavigationService>();
  UpdateViewModel(this._repo);
  Future<void> getUpdate() async {
    final res = await _repo.getUpdate();
    res.fold(
      (l) {
        _navigator.navigateToUpdateView();
      },
      (r) {
        if (r) {
          _navigator.navigateToHomeView();
        } else {
          _navigator.navigateToUpdateView();
        }
      },
    );
  }
}
