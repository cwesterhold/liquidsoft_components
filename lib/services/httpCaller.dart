import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_components/dao.dart';

import 'liquidServices.dart';

class HTTPCaller {
  final Connectivity _connectivity = Connectivity();
  LiquidService _liquidService = LiquidService();

  Future getNoTimeoutData(String url) async {
    Map<String, String> headers = {
      "Authorization": Dao.inst.authToken,
      "Access-Control-Allow-Origin": '*',
      "accept": "application/json",
      "content-type": "application/json",
    };

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else if (response.statusCode != 200 && Dao.inst.isDebug == true) {
      throw ("Something went horribly wrong..." +
          response.statusCode.toString() +
          "...." +
          response.body);
    } else if (response.statusCode != 200 && Dao.inst.isDebug == false) {
      _liquidService.throwHTTPError(response.statusCode.toString(), response.body);
    }
  }

  Future getData(String url) async {
    http.Response? response;

    Map<String, String> headers = {
      "Authorization": Dao.inst.authToken,
      "Access-Control-Allow-Origin": '*',
      "accept": "application/json",
      "content-type": "application/json",
    };
    try {
      response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(Duration(seconds: Dao.inst.httpTimeout));

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode != 200 && Dao.inst.isDebug == true) {
        throw ("Something went horribly wrong..." +
            response.statusCode.toString() +
            "...." +
            response.body);
      } else if (response.statusCode != 200 && Dao.inst.isDebug == false) {
        return _liquidService.throwHTTPError(response.statusCode.toString(), response.body);
      }
    } on TimeoutException catch (e) {
      var connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return _liquidService.throwConnectivityError();
      } else {
        return _liquidService.throwHTTPError('500', e.toString());
      }
    } catch (e) {
      return _liquidService.throwHTTPError('500', e.toString());
    }
  }

  Future postData(String url, dynamic json) async {
    Map<String, String> headers = {
      "Authorization": Dao.inst.authToken,
      "accept": "application/json",
      "content-type": "application/json",
    };

    try {
      http.Response response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(json))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode != 200 && Dao.inst.isDebug == true) {
        throw ("Something went horribly wrong..." +
            response.statusCode.toString() +
            "...." +
            response.body);
      } else if (response.statusCode != 200 && Dao.inst.isDebug == false) {
        return _liquidService.throwHTTPError(response.statusCode.toString(), response.body);
      }
    } on TimeoutException catch (e) {
      var connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return _liquidService.throwConnectivityError();
      } else {
        return _liquidService.throwHTTPError('500', e.toString());
      }
    } catch (e) {
      return _liquidService.throwHTTPError('500', e.toString());
    }
  }

  Future patchData(String url, dynamic json) async {
    Map<String, String> headers = {
      "Authorization": Dao.inst.authToken,
      "accept": "application/json",
      "content-type": "application/json",
    };

    try {
      http.Response response = await http
          .patch(Uri.parse(url), headers: headers, body: jsonEncode(json))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode != 200 && Dao.inst.isDebug == true) {
        throw ("Something went horribly wrong..." +
            response.statusCode.toString() +
            "...." +
            response.body);
      } else if (response.statusCode != 200 && Dao.inst.isDebug == false) {
        return _liquidService.throwHTTPError(response.statusCode.toString(), response.body);
      }
    } on TimeoutException catch (e) {
      var connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return _liquidService.throwConnectivityError();
      } else {
        return _liquidService.throwHTTPError('500', e.toString());
      }
    } catch (e) {
      return _liquidService.throwHTTPError('500', e.toString());
    }
  }

  Future deleteData(String url) async {
    Map<String, String> headers = {"Authorization": "08022020-LiquidSoft"};

    try {
      http.Response response =
          await http.delete(Uri.parse(url), headers: headers).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode != 200 && Dao.inst.isDebug == true) {
        throw ("Something went horribly wrong..." +
            response.statusCode.toString() +
            "...." +
            response.body);
      } else if (response.statusCode != 200 && Dao.inst.isDebug == false) {
        return _liquidService.throwHTTPError(response.statusCode.toString(), response.body);
      }
    } on TimeoutException catch (e) {
      var connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return _liquidService.throwConnectivityError();
      } else {
        return _liquidService.throwHTTPError('500', e.toString());
      }
    } catch (e) {
      return _liquidService.throwHTTPError('500', e.toString());
    }
  }
}
