import 'package:notifyme/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:notifyme/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:notifyme/ui/views/home/screens/home_view.dart';
import 'package:notifyme/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:notifyme/ui/views/counter/counter_view.dart';
import 'package:notifyme/ui/views/login/login_view.dart';
import 'package:notifyme/services/scraper_service.dart';
import 'package:notifyme/services/api_service.dart';
import 'package:notifyme/services/job_service.dart';
import 'package:notifyme/services/notification_service.dart';
import 'package:notifyme/ui/views/update/update_view.dart';
import 'package:notifyme/services/local_db_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: UpdateView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ScraperService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: JobService),
    LazySingleton(classType: NotificationService),
    LazySingleton(classType: NotificationService),
    LazySingleton(classType: LocalDbService),
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
