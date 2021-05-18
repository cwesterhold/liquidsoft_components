library liquidsoft_components;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';
import 'package:liquidsoft_components/models/dao.dart';
import 'package:liquidsoft_components/models/errorHandling/errorManager.dart';

///export services and services
export 'package:liquidsoft_components/models/actionButton.dart';
export 'package:liquidsoft_components/models/navBarItems.dart';
export 'package:liquidsoft_components/services/hexcolor.dart';
export 'package:liquidsoft_components/services/liquidHTTPCaller.dart';
export 'package:liquidsoft_components/services/liquidServices.dart';
export 'package:liquidsoft_components/services/platformInfo.dart';
export 'package:liquidsoft_components/widgets/liquidAppBar.dart';
export 'package:liquidsoft_components/widgets/liquidApproveDialog.dart';
export 'package:liquidsoft_components/widgets/liquidButton.dart';
export 'package:liquidsoft_components/widgets/liquidDate.dart';
export 'package:liquidsoft_components/widgets/liquidDropdown.dart';
export 'package:liquidsoft_components/widgets/liquidHeader.dart';
export 'package:liquidsoft_components/widgets/liquidLogo.dart';
export 'package:liquidsoft_components/widgets/liquidMultiText.dart';
export 'package:liquidsoft_components/widgets/liquidScaffold.dart';
export 'package:liquidsoft_components/widgets/liquidSecondaryAppBar.dart';
export 'package:liquidsoft_components/widgets/liquidSpinner.dart';
export 'package:liquidsoft_components/widgets/liquidText.dart';
export 'package:liquidsoft_components/widgets/liquidToggleBar.dart';

class LiquidSoftComponents {
  LiquidSoftService _liquidService = LiquidSoftService();

  /// is this local development or running in production
  bool isDebug;

  /// The root widget for the application
  Widget rootWidget;

  /// location of the logo to use for light modes
  String? logoLocationLight;

  /// location of the logo for use in dark modes
  String? logoLocationDark;

  String? errorAdminEmail;

  /// Dialog header for general errors
  String? generalErrorHeader;

  /// Dialog body text pre error body
  String? generalPreErrorMessage;

  /// Dialog body text post error body
  String? generalPostErrorMessage;

  /// headers to be send for every http call
  Map<String, String>? httpHeaders;

  /// timeout for each http call
  /// There is a getNoTimeoutData method to ignore this setting
  int? httpTimeout;

  /// Dialog header for http errors
  String? httpErrorHeader;

  /// Dialog body text pre error code message
  String? httpPreErrorMessage;

  /// Dialog body text post error code message
  String? httpPostErrorMessage;

  /// Dialog header for connectivity errors
  String? connectivityErrorHeader;

  /// Dialog body text for connectivity errors
  String? connectivityErrorMessage;

  LiquidSoftComponents(
      {required this.isDebug,
      required this.rootWidget,
      this.logoLocationLight,
      this.logoLocationDark,
      this.errorAdminEmail,
      this.generalErrorHeader,
      this.generalPreErrorMessage,
      this.generalPostErrorMessage,
      this.httpHeaders,
      this.httpTimeout,
      this.httpErrorHeader,
      this.httpPreErrorMessage,
      this.httpPostErrorMessage,
      this.connectivityErrorHeader,
      this.connectivityErrorMessage}) {
    _mainConfig();
  }

  void _mainConfig() async {
    ErrorManager _errorManager = ErrorManager();

    /// take all of the init variables and write them to the Dao singleton
    /// this singleton will populate these variables to all other needed locations
    if (httpHeaders != null) Dao.inst.httpHeaders = httpHeaders;
    if (httpTimeout != null) Dao.inst.httpTimeout = httpTimeout;
    Dao.inst.isDebug = isDebug;
    if (errorAdminEmail != null) Dao.inst.errorAdminEmail = errorAdminEmail;
    if (generalErrorHeader != null) Dao.inst.generalErrorHeader = generalErrorHeader;
    if (generalPreErrorMessage != null) Dao.inst.generalPreErrorMessage = generalPreErrorMessage;
    if (generalPostErrorMessage != null) Dao.inst.generalPostErrorMessage = generalPostErrorMessage;
    if (httpErrorHeader != null) Dao.inst.httpErrorHeader = httpErrorHeader;
    if (httpPreErrorMessage != null) Dao.inst.httpPreErrorMessage = httpPreErrorMessage;
    if (httpPostErrorMessage != null) Dao.inst.httpPostErrorMessage = httpPostErrorMessage;
    if (connectivityErrorHeader != null) Dao.inst.connectivityErrorHeader = connectivityErrorHeader;
    if (connectivityErrorMessage != null)
      Dao.inst.connectivityErrorMessage = connectivityErrorMessage;
    Dao.inst.logoLocationLight = logoLocationLight;
    Dao.inst.logoLocationDark = logoLocationDark;

    Dao.inst.globalNavigatorKey = new GlobalKey<NavigatorState>();

    await _errorManager.initError(isDebug, errorAdminEmail);
    await _runApp(rootWidget);
  }

  initError() {
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (Dao.inst.isDebug == true) {
        print(
            'Exception: ${details.exception.toString()} \n\n StackTrace:${details.stack.toString()} \n\n ErrorBody: ${details.toString()}');
      } else {
        _liquidService.catchError(details.exception.toString());
        if (Dao.inst.errorAdminEmail != null) {
          _liquidService.sendMail(errorAdminEmail!, 'App Error Email', 'generalErrorHeader',
              'Exception: ${details.exception.toString()} \n\n StackTrace:${details.stack.toString()} \n\n ErrorBody: ${details.toString()}');
        }
      }
    };
  }

  _runApp(Widget rootWidget) {
    runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        print('LiquidSoft Components Initialized');
        runApp(rootWidget);
      },
      (dynamic error, StackTrace stackTrace) {
        if (Dao.inst.isDebug == true) {
          print('Exception: $error \n\n StackTrace:${stackTrace.toString()}');
        } else {
          _liquidService.catchError(error.toString());
          if (Dao.inst.errorAdminEmail != null) {
            _liquidService.sendMail(errorAdminEmail!, 'App Error Email', 'generalErrorHeader',
                'Exception: $error \n\n StackTrace:${stackTrace.toString()}');
          }
        }
      },
    );
  }
}
