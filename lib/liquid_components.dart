library liquidsoft_components;

import 'package:liquidsoft_components/dao.dart';

export 'package:liquidsoft_components/services/hexcolor.dart';
export 'package:liquidsoft_components/services/liquidHTTPCaller.dart';

///export services and services
export 'package:liquidsoft_components/services/liquidServices.dart';
export 'package:liquidsoft_components/services/platformInfo.dart';
export 'package:liquidsoft_components/widgets/liquidApproveDialog.dart';
export 'package:liquidsoft_components/widgets/liquidButton.dart';
export 'package:liquidsoft_components/widgets/liquidDate.dart';
export 'package:liquidsoft_components/widgets/liquidDropdown.dart';
export 'package:liquidsoft_components/widgets/liquidHeader.dart';
export 'package:liquidsoft_components/widgets/liquidLogo.dart';
export 'package:liquidsoft_components/widgets/liquidMultiText.dart';
export 'package:liquidsoft_components/widgets/liquidSmallButton.dart';
export 'package:liquidsoft_components/widgets/liquidSpinner.dart';
export 'package:liquidsoft_components/widgets/liquidText.dart';
export 'package:liquidsoft_components/widgets/liquidToggleBar.dart';

class LiquidSoftComponents {
  /// this call is required to set up variables used in the services
  initState({
    /// is this local development or running in production
    required bool isDebug,

    /// location of the logo to use for light modes
    String? logoLocationLight,

    /// location of the logo for use in dark modes
    String? logoLocationDark,

    /// headers to be send for every http call
    Map<String, String>? httpHeaders,

    /// timeout for each http call
    /// There is a getNoTimeoutData method to ignore this setting
    int httpTimeout = 5,

    /// Dialog header for http errors
    String? httpErrorHeader,

    /// Dialog body text pre error code message
    String? httpPreErrorMessage,

    /// Dialog body text post error code message
    String? httpPostErrorMessage,

    /// Dialog header for connectivity errors
    String? connectivityErrorHeader,

    /// Dialog body text for connectivity errors
    String? connectivityErrorMessage,
  }) {
    /// take all of the init variables and write them to the Dao singleton
    /// this singleton will populate these variables to all other needed locations
    if (httpHeaders != null) Dao.inst.httpHeaders = httpHeaders;
    Dao.inst.httpTimeout = httpTimeout;
    Dao.inst.isDebug = isDebug;
    if (httpErrorHeader != null) Dao.inst.httpErrorHeader = httpErrorHeader;
    if (httpPreErrorMessage != null)
      Dao.inst.httpPreErrorMessage = httpPreErrorMessage;
    if (httpPostErrorMessage != null)
      Dao.inst.httpPostErrorMessage = httpPostErrorMessage;
    if (connectivityErrorHeader != null)
      Dao.inst.connectivityErrorHeader = connectivityErrorHeader;
    if (connectivityErrorMessage != null)
      Dao.inst.connectivityErrorMessage = connectivityErrorMessage;
    Dao.inst.logoLocationLight = logoLocationLight;
    Dao.inst.logoLocationDark = logoLocationDark;

    /// successful initiation
    print('LiquidSoft Components Init Successful');
  }
}
