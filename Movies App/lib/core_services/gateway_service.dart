import 'dart:convert';

import 'package:http/http.dart';
import '../models/enums/http_methods.dart';
import '../services/connectivity_services.dart';
import '../models/constants.dart';
import '../models/api_response.dart';
import 'log_service.dart';
import 'service_config.dart';

abstract class IGateWay {
  Future<ApiResponse> invoke(String identifier, [Map<String, String>? payload]);
}

class Gateway implements IGateWay {
  IServiceConfig _serviceConfig;
  var client = Client();

  Gateway(this._serviceConfig);

  @override
  Future<ApiResponse> invoke(String identifier,
      [Map<String, String>? payload]) async {
    Response response;
    ApiResponse apiResponse;

    payload = payload ?? {};
    var config = _serviceConfig.getConfig(identifier);
    if (config == null) {
      var msg =
          'The requested Identifier not found in config collection or url not configured';
      Log.instance.log(msg);

      return ApiResponse.specificFailure(Constants.configNotFound, msg);
    }

    try {
      Log.instance.log('Gateway -- called with identifier - ' +
          identifier +
          ' and payload-- ' +
          payload.toString());

      HTTPMETHODS? method = config['http_method'];
      bool? isAuthRoute = config['isAuthRoute'];
      String url = config['url']; // _getUrl(config['url'], payload);

      Log.instance.log('Gateway -- url - ' +
          url +
          ' and   method -- ' +
          method.toString() +
          ' payload-- ' +
          payload.toString());

      final isConnected = await ConnectivityService.isConnected();
      if (isConnected) {
        response = await _executeRequest(method, url, payload, isAuthRoute);
        // print('response');
        // print(response);
      } else {
        return ApiResponse.networkFailure(
            Constants.connectionErrorTitle, Constants.connectionError);
      }

      if (response != null) {
        Log.instance.log('Gateway -- response in success for identifier-- ' +
            identifier +
            ' code -- ' +
            response.statusCode.toString());
        //Log.instance.log('Response body -- ' + response.body);

        // print('response is');
        // print(response.body);
        // print(response);
        apiResponse = _checkResponseSuccess(response)
            ? ApiResponse(response)
            : handleFaliure(identifier, response);
      } else {
        apiResponse = ApiResponse.specificFailure(
            Constants.httpMethodNotSupported,
            'The requested http method is not supported');
      }
    } catch (e, stackTrace) {
      Log.instance.log('Gateway -- in exception for identifier-- ' +
          identifier +
          ' catch  -- ' +
          e.toString());
      apiResponse =
          handleException(e as Exception, identifier, stackTrace: stackTrace);
    }
    return apiResponse;
  }

  _executeRequest(HTTPMETHODS? method, String url, Map<String, String> payload,
      bool? isAuthRoute) async {
    Response? response;
    // print('method == HTTPMETHODS.GET');
    // print(method == HTTPMETHODS.GET);
    if (payload != {}) {
      response = await client.get(Uri.parse(url), headers: payload);
    } else {
      response = await client.get(Uri.parse(url));
    }
    // switch (method) {
    //   case HTTPMETHODS.GET:
    //     response = await _get(url, isAuthRoute: isAuthRoute!);
    //     break;
    //   case HTTPMETHODS.POST:
    //     response = await _post(url, payload, isAuthRoute: isAuthRoute!);
    //     break;
    //   case HTTPMETHODS.PUT:
    //     response = await _put(url, payload, isAuthRoute: isAuthRoute!);
    //     break;
    //   case HTTPMETHODS.PATCH:
    //     response = await _patch(url, payload, isAuthRoute: isAuthRoute!);
    //     break;
    //   case HTTPMETHODS.DELETE:
    //     response = await _delete(url, isAuthRoute: isAuthRoute!);
    //     break;
    //   default:
    //     // response = null;
    //     response = await _get(url, isAuthRoute: isAuthRoute!);
    //     break;
    // }
    return response;
  }

  Future<Response> _post(String url, Object data,
      {bool isAuthRoute = false}) async {
    return client.post(Uri.parse(url),
        body: data != null ? json.encode(data) : null);
  }

  Future<Response> _get(String url, {bool isAuthRoute = false}) async {
    // print(url);
    return client.get(Uri.parse(url));
  }

  Future<Response> _put(String url, Object data,
      {bool isAuthRoute = false}) async {
    return client.put(Uri.parse(url), body: json.encode(data));
  }

  Future<Response> _patch(String url, Object data,
      {bool isAuthRoute = false}) async {
    return client.patch(Uri.parse(url), body: json.encode(data));
  }

  Future<Response> _delete(String url, {bool isAuthRoute = false}) async {
    return client.delete(Uri.parse(url));
  }

  bool _checkResponseSuccess(Response r) {
    return (r.statusCode >= 200 && r.statusCode < 300);
  }

  handleFaliure(String identifier, Response response) {
    Log.instance.log(
        '$identifier error, status code: ${response.statusCode}, error: ${response.body}');
    return ApiResponse.failure(response.statusCode, response);
  }

  handleException(Exception e, String url, {StackTrace? stackTrace}) {
    Log.instance.log('network error, url:$url, message: ${e.toString()}',
        stackTrace: stackTrace);

    return ApiResponse.networkFailure(
        Constants.networkErrorTitle, e.toString());
  }
}
