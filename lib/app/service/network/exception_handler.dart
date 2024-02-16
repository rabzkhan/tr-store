import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../api/api_exceptions.dart';

mixin class ExceptionHandler {
  RxBool isError = false.obs;

  void handleError(error) {
    isError.value = true;
    var errorText = DioExceptions.fromDioError(error).toString();
    Logger().e(errorText);
  }
}
