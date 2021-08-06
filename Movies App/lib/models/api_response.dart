import 'dart:io';
import 'package:http/http.dart' as http;

import 'constants.dart';

class ApiResponse<T> {
  T? model;
  String? errorMessage;
  int? statusCode;
  String? localErrorMessage;
  String? localErrorTitle;
  bool? isNetworkError;
  bool? success;

  ApiResponse(this.model) {
    success = true;
    isNetworkError = false;
    statusCode = HttpStatus.ok;
  }

  ApiResponse.networkFailure(this.localErrorTitle, this.localErrorMessage) {
    success = false;
    isNetworkError = true;
    // todo: should this have a default statusCode... do network errors have status codes?
  }

  ApiResponse.specificFailure(this.localErrorTitle, this.localErrorMessage) {
    success = false;
    isNetworkError = false;
  }

  ApiResponse.failure(this.statusCode, [this.model]) {
    String serverMsg = "";
    if (this.model != null) {
      serverMsg = (this.model as http.Response).body;
    }
    switch (statusCode) {
      // case 504:
      //   break;
      // case 401:
      //   break;
      default:
        if (400 <= statusCode! && statusCode! < 500) {
          localErrorMessage =
              serverMsg.isNotEmpty ? serverMsg : Constants.errorMessage4xx;
          localErrorTitle = Constants.errorTitle4xx;
        } else if (500 <= statusCode! && statusCode! < 600) {
          localErrorMessage = Constants.errorMessage5xx;
          localErrorTitle = Constants.errorTitle5xx;
        } else {
          localErrorMessage = Constants.errorUnknownError;
          localErrorTitle = Constants.errorTitle;
        }
        break;
    }
    success = false;
    isNetworkError = false;
  }

  ApiResponse.constructFrom(ApiResponse apiResponse) {
    localErrorMessage = apiResponse.localErrorMessage;
    localErrorTitle = apiResponse.localErrorTitle;
    success = apiResponse.success;
    isNetworkError = apiResponse.isNetworkError;
  }

  @override
  String toString() {
    return 'ApiResponse{model: $model, errorMessage: $errorMessage, success: $success}';
  }
}
