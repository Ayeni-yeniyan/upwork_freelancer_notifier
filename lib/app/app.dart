import 'package:notifyme/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:notifyme/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:notifyme/ui/views/home/screens/home_view.dart';
import 'package:notifyme/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:notifyme/ui/views/login/login_view.dart';
import 'package:notifyme/services/scraper_service.dart';
import 'package:notifyme/services/job_service.dart';
import 'package:notifyme/ui/views/update/update_view.dart';
import 'package:notifyme/services/local_db_service.dart';
import 'package:notifyme/ui/dialogs/loading/loading_dialog.dart';
import 'package:notifyme/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:notifyme/ui/views/profile/profile_view.dart';
import 'package:notifyme/ui/dialogs/activate_scrapper/activate_scrapper_dialog.dart';
import 'package:notifyme/ui/dialogs/action_required/action_required_dialog.dart';
import 'package:notifyme/ui/dialogs/sign_in_upwork/sign_in_upwork_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: UpdateView),
    MaterialRoute(page: BottomNavView),
    MaterialRoute(page: ProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ScraperService),
    LazySingleton(classType: JobService),
    LazySingleton(classType: LocalDbService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: LoadingDialog),
    StackedDialog(classType: ActivateScrapperDialog),
    StackedDialog(classType: ActionRequiredDialog),
    StackedDialog(classType: SignInUpworkDialog),
// @stacked-dialog
  ],
)
class App {}
