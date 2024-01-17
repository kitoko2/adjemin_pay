import 'dart:developer';

import 'package:adjemin_pay/controllers/adjemin_pay_controller.dart';
import 'package:adjemin_pay/data/models/create_pay.dart';
import 'package:adjemin_pay/data/models/make_pay.dart';
import 'package:adjemin_pay/data/models/payement/payement.dart';
import 'package:adjemin_pay/data/models/payement_status.dart';
import 'package:adjemin_pay/utils/constant.dart';
import 'package:adjemin_pay/utils/dio_custom/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MerchandServices {
  static final controller = Get.find<AdjeminPayController>();
  static ApiProvider apiProvider = ApiProvider();
  static Future<String?> getAccesToken(
      {required String clientId, required String clientSecret}) async {
    log("*********GET MERCHAND ACCES TOKEN************");
    String url = Constant.urlMerchantAccesToken;
    final data = {
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': Constant.grantType,
    };
    print(data);
    try {
      var response = await apiProvider.dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        data: data,
      );
      log(response.data.toString());

      if (response.statusCode == 200) {
        final accesToken = response.data['access_token'];
        return accesToken;
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

  static Future<Payement?> createPayement(
      {required String accesToken, required CreatePay createPay}) async {
    log("*********CREATE PAYEMENT************");
    String url = Constant.urlCreatePayement;
    final data = createPay.toJson();
    print(data);
    try {
      var response = await apiProvider.dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer $accesToken"
          },
        ),
        data: data,
      );
      log(response.data.toString());

      if (response.statusCode == 200 && response.data['success'] == true) {
        final payement = Payement.fromJson(response.data['data']);
        return payement;
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

  static Future<Payement?> getPayement(
      {required String accesToken, required String idPayement}) async {
    log("*********GET PAYEMENT************");
    String url = Constant.urlGetPayement + idPayement;
    try {
      var response = await apiProvider.dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer $accesToken"
          },
        ),
      );
      log(response.data.toString());

      if (response.statusCode == 200 && response.data['success'] == true) {
        final payement =
            Payement.fromJson(response.data['data']['transaction'][0]);
        return payement;
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

  static Future<ResultMakePayement> makePayement(
      {required MakePay makePay, required String accesToken}) async {
    log("*********MAKE PAYEMENT************");
    String url = Constant.urlMakePayement;
    final data = makePay.toJson();
    try {
      var response = await apiProvider.dio.post(
        url,
        options: Options(
          validateStatus: (status) {
            if (status == null) {
              return false;
            }
            if (status == 400) {
              return true;
            }
            return status >= 200 && status < 300;
          },
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer $accesToken"
          },
        ),
        data: data,
      );
      log(response.data.toString());

      if (response.statusCode == 200 && response.data['success'] == true) {
        final payementUrl = response.data['data']['payment_url'];
        return ResultMakePayement(res: true, payementUrl: payementUrl);
      }
      final errorMsg = response.data['message'] + response.data['error'];
      controller.error.value = errorMsg ?? 'Erreur survenue';
      return ResultMakePayement(res: false, payementUrl: null);
    } on DioError catch (e) {
      catchErrorMessage(e);
      return ResultMakePayement(res: false, payementUrl: null);
    } catch (e) {
      controller.error.value = e.toString();
      log(e.toString());
      return ResultMakePayement(res: false, payementUrl: null);
    }
  }

  static Future<ResultPayementStatus> getPayementStatus(
      {required String idTransaction, required String accesToken}) async {
    print("ID TRANSACTION : $idTransaction");
    print("ACCES TOKEN : $accesToken");

    log("*********GET PAYEMENT STATUS************");
    String url = Constant.urlGetPayementStatus + idTransaction;
    try {
      var response = await apiProvider.dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer $accesToken"
          },
        ),
      );
      log(response.data.toString());

      if (response.statusCode == 200 && response.data['success'] == true) {
        final payementStatus = PayementStatus.fromJson(response.data['data']);
        return ResultPayementStatus(
            errorMessage: null,
            payementStatus: payementStatus,
            loadCheck: false);
      }
      return ResultPayementStatus(
          errorMessage: response.data['message'] ?? 'Erreur survenue',
          payementStatus: null,
          loadCheck: false);
    } on DioError catch (e) {
      log(e.toString());

      if (e.response != null) {
        log(e.response!.data.toString());
        return ResultPayementStatus(
          errorMessage: e.response!.data['message'] ?? 'Erreur survenue',
          payementStatus: null,
          loadCheck: e.type == DioErrorType.unknown,
        );
      }
      return ResultPayementStatus(
          errorMessage: e.message ?? 'Erreur survenue',
          payementStatus: null,
          loadCheck: e.type == DioErrorType.unknown);
    } catch (e) {
      log(e.toString());
      return ResultPayementStatus(
        errorMessage: e.toString(),
        loadCheck: false,
        payementStatus: null,
      );
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

class ResultMakePayement {
  final bool res;
  final String? payementUrl;

  ResultMakePayement({required this.res, required this.payementUrl});
}

class ResultPayementStatus {
  final PayementStatus? payementStatus;
  final String? errorMessage;
  final bool loadCheck;

  ResultPayementStatus({
    required this.payementStatus,
    required this.errorMessage,
    required this.loadCheck,
  });
}
