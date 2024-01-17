import 'dart:developer';

import 'package:adjemin_pay/controllers/adjemin_pay_controller.dart';
import 'package:adjemin_pay/data/models/operator/operator.dart';
import 'package:adjemin_pay/utils/constant.dart';
import 'package:adjemin_pay/utils/dio_custom/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class OperatorService {
  static ApiProvider apiProvider = ApiProvider();
  static final controller = Get.find<AdjeminPayController>();

  // static String getCountryISOCode() {
  //   final WidgetsBinding instance = WidgetsBinding.instance;
  //   final List<Locale> systemLocales = instance.window.locales;
  //   String? isoCountryCode = systemLocales.first.countryCode;
  //   if (isoCountryCode != null) {
  //     print(isoCountryCode);
  //     return isoCountryCode;
  //   } else {
  //     throw Exception("Unable to get Country ISO code");
  //   }
  // }

  static Future<List<Operator>?> getOperatorByCountry(
      String countryCode) async {
    log("*********GET OPERATOR BY COUNTRY************");
    String url = Constant.urlGetOperatorByCountry + countryCode;
    try {
      var response = await apiProvider.dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      log(response.data.toString());

      if (response.statusCode == 200 && response.data['success'] == true) {
        final operators = (response.data['data'] as List)
            .map((e) => Operator.fromJson(e))
            .toList();
        return operators;
      }
      controller.error.value = response.data['message'] ?? 'Erreur survenue';
      return null;
    } on DioError catch (e) {
      catchErrorMessage(e);
      return null;
    } catch (e) {
      catchErrorMessage(e);
      return null;
    }
  }

  static catchErrorMessage(Object e) {
    log(e.toString());
    if (e is DioError) {
      if (e.response != null) {
        controller.error.value = e.response!.data['message'];
      } else {
        controller.error.value = e.message ?? 'Erreur inconue';
      }
    } else {
      controller.error.value = e.toString();
    }
  }
}
