// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/action_required/action_required_dialog.dart';
import '../ui/dialogs/activate_scrapper/activate_scrapper_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/loading/loading_dialog.dart';
import '../ui/dialogs/sign_in_upwork/sign_in_upwork_dialog.dart';

enum DialogType {
  infoAlert,
  loading,
  activateScrapper,
  actionRequired,
  signInUpwork,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.loading: (context, request, completer) =>
        LoadingDialog(request: request, completer: completer),
    DialogType.activateScrapper: (context, request, completer) =>
        ActivateScrapperDialog(request: request, completer: completer),
    DialogType.actionRequired: (context, request, completer) =>
        ActionRequiredDialog(request: request, completer: completer),
    DialogType.signInUpwork: (context, request, completer) =>
        SignInUpworkDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
