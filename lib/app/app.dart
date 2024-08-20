import 'package:upwork_freelancer_notifier/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:upwork_freelancer_notifier/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:upwork_freelancer_notifier/ui/views/home/home_view.dart';
import 'package:upwork_freelancer_notifier/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:upwork_freelancer_notifier/ui/views/counter/counter_view.dart';
import 'package:upwork_freelancer_notifier/ui/views/login/login_view.dart';
import 'package:upwork_freelancer_notifier/services/scraper_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ScraperService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
