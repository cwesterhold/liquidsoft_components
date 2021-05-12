library liquid_components;

import 'package:flutter/material.dart';
import 'package:liquid_components/dao.dart';

///export services and services
export 'package:liquid_components/services/liquidServices.dart';
export 'package:liquid_components/widgets/liquidApproveDialog.dart';
export 'package:liquid_components/widgets/liquidButton.dart';
export 'package:liquid_components/widgets/liquidDate.dart';
export 'package:liquid_components/widgets/liquidDropdown.dart';
export 'package:liquid_components/widgets/liquidHeader.dart';
export 'package:liquid_components/widgets/liquidLogo.dart';
export 'package:liquid_components/widgets/liquidMultiText.dart';
export 'package:liquid_components/widgets/liquidSmallButton.dart';
export 'package:liquid_components/widgets/liquidSpinner.dart';
export 'package:liquid_components/widgets/liquidText.dart';
export 'package:liquid_components/widgets/liquidToggleBar.dart';

abstract class LiquidComponents {
  LiquidComponents();

  /// this call is required to set up variables used in the services
  initState({
    required String authToken,
    bool isDebug = false,
    required Key globalNavigatorKey,
    String? httpErrorHeader,
    String? httpPreErrorMessage,
    String? httpPostErrorMessage,
    String? connectivityErrorHeader,
    String? connectivityErrorMessage,
  }) {
    Dao.inst.authToken = authToken;
    Dao.inst.isDebug = isDebug;
    Dao.inst.globalNavigatorKey = globalNavigatorKey;
    if (httpErrorHeader != null) Dao.inst.httpErrorHeader = httpErrorHeader;
    if (httpPreErrorMessage != null) Dao.inst.httpPreErrorMessage = httpPreErrorMessage;
    if (httpPostErrorMessage != null) Dao.inst.httpPostErrorMessage = httpPostErrorMessage;
    if (connectivityErrorHeader != null) Dao.inst.connectivityErrorHeader = connectivityErrorHeader;
    if (connectivityErrorMessage != null)
      Dao.inst.connectivityErrorMessage = connectivityErrorMessage;
  }
}
