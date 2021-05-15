/// This is the singleton that holds the variables after initialization
class Dao {
  Dao._internal();
  static final Dao _singleton = new Dao._internal();
  static get inst => _singleton;

  Map<String, String>? httpHeaders;
  late bool isDebug;
  late int httpTimeout;
  String httpErrorHeader = 'Application Error';
  String httpPreErrorMessage =
      'There was an error connecting to our backend servers.';
  String httpPostErrorMessage =
      'If this error persist, please contact support.';
  String connectivityErrorHeader = 'Connectivity Error';
  String connectivityErrorMessage =
      'It appears that you are connected to a network with no connectivity to the internet.  Please check your connection an try again.';
  late String logoLocationDark;
  late String logoLocationLight;
}
