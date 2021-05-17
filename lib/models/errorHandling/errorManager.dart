import 'errorStub.dart'
    if (dart.library.io) 'mobile.dart'
    if (dart.library.html) 'web.dart';

abstract class ErrorManager {
  initError(isDebug, errorAdminEmail);

  factory ErrorManager() => getManager();
}
