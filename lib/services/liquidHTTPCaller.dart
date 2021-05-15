import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:liquidsoft_components/models/dao.dart';

import 'liquidServices.dart';

class LiquidHTTPCaller {
  final Connectivity _connectivity = Connectivity();
  LiquidSoftService _liquidService = LiquidSoftService();

  Future getNoTimeoutData(String url) async {
    http.Response response;

    Dao.inst.httpHeaders == null
        ? response = await http.get(Uri.parse(url))
        : response = await http.get(Uri.parse(url), headers: Dao.inst.httpHeaders);

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

    try {
      Dao.inst.httpHeaders == null
          ? response =
              await http.get(Uri.parse(url)).timeout(Duration(seconds: Dao.inst.httpTimeout))
          : response = await http
              .get(Uri.parse(url), headers: Dao.inst.httpHeaders)
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
    http.Response response;

    try {
      Dao.inst.httpHeaders == null
          ? response = await http
              .post(Uri.parse(url), body: jsonEncode(json))
              .timeout(Duration(seconds: Dao.inst.httpTimeout))
          : response = await http
              .post(Uri.parse(url), headers: Dao.inst.httpHeaders, body: jsonEncode(json))
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

  Future patchData(String url, dynamic json) async {
    http.Response response;

    try {
      Dao.inst.httpHeaders == null
          ? response = await http
              .patch(Uri.parse(url), body: jsonEncode(json))
              .timeout(Duration(seconds: Dao.inst.httpTimeout))
          : response = await http
              .patch(Uri.parse(url), headers: Dao.inst.httpHeaders, body: jsonEncode(json))
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

  Future deleteData(String url) async {
    http.Response response;

    try {
      Dao.inst.httpHeaders == null
          ? response =
              await http.delete(Uri.parse(url)).timeout(Duration(seconds: Dao.inst.httpTimeout))
          : response = await http
              .delete(Uri.parse(url), headers: Dao.inst.httpHeaders)
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
}
