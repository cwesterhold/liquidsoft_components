import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';

import 'errorManager.dart';

ErrorManager getManager() => WebErrors();

class WebErrors implements ErrorManager {
  LiquidSoftService _liquidService = LiquidSoftService();

  @override
  initError(isDebug, errorAdminEmail) {
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (isDebug == true) {
        print(
            'Exception: ${details.exception.toString()} \n\n StackTrace:${details.stack.toString()} \n\n ErrorBody: ${details.toString()}');
      } else {
        _liquidService.catchError(details.exception.toString());
        if (errorAdminEmail != null) {
          _liquidService.sendMail(errorAdminEmail!, 'App Error Email', 'generalErrorHeader',
              'Exception: ${details.exception.toString()} \n\n StackTrace:${details.stack.toString()} \n\n ErrorBody: ${details.toString()}');
        }
      }
    };

    Isolate.current.addErrorListener(RawReceivePort((dynamic pair) async {
      final isolateError = pair as List<dynamic>;
      if (isDebug == true) {
        print('Exception: ${isolateError.toString()}');
      } else {
        _liquidService.catchError(isolateError.toString());
        if (errorAdminEmail != null) {
          _liquidService.sendMail(errorAdminEmail!, 'App Error Email', 'generalErrorHeader',
              'Exception: ${isolateError.toString()}');
        }
      }
    }).sendPort);
  }
}
