// ignore_for_file: file_names, depend_on_referenced_packages, unused_import, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import '../model/tokenRequest_model.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';

class ApiService {
  // signup ////////////////////////////////////////////////////////////////////////////////
  static Future addTokenRequest(TokenRequestModal data) async {
    try {
      final _dio = Dio();
      String citizenImageFront = data.citizenImageFront != null
          ? data.citizenImageFront!.path.split('/').last
          : "null";
      String citizenImageBack = data.citizenImageBack != null
          ? data.citizenImageBack!.path.split('/').last
          : "null";
      String companyRegistration = data.companyRegistration != null
          ? data.companyRegistration!.path.split('/').last
          : "null";
      String companyPanVat = data.companyPanVat != null
          ? data.companyPanVat!.path.split('/').last
          : "null";
      final FormData _formdata = FormData.fromMap({
        "name": data.name,
        "phone": data.phone,
        "email": data.email,
        "companyName": data.companyName,
        "websiteApplication": data.websiteApplication,
        "requirement": data.requirement,
        "citizenImageFront": data.citizenImageFront != null
            ? await MultipartFile.fromFile(data.citizenImageFront!.path,
                filename: citizenImageFront,
                contentType:
                    MediaType('image', citizenImageFront.split(".").last))
            : null,
        "citizenImageBack": data.citizenImageBack != null
            ? await MultipartFile.fromFile(data.citizenImageBack!.path,
                filename: citizenImageBack,
                contentType:
                    MediaType('image', citizenImageBack.split(".").last))
            : null,
        "companyRegistration": data.companyRegistration != null
            ? await MultipartFile.fromFile(data.companyRegistration!.path,
                filename: companyRegistration,
                contentType:
                    MediaType('image', companyRegistration.split(".").last))
            : null,
        "companyPanVat": data.companyPanVat != null
            ? await MultipartFile.fromFile(data.companyPanVat!.path,
                filename: companyPanVat,
                contentType: MediaType('image', companyPanVat.split(".").last))
            : null,
      });
      final response = await _dio.post(
          "https://cylinder.eachut.com/purchaseTokenRequest",
          data: _formdata);
      var decoded = jsonDecode(response.toString());

      if (response.statusCode == 200 || response.statusCode == 400) {
        return decoded;
      }
      return decoded;
    } on DioError catch (e) {
      return e;
    } catch (e) {
      return e;
    }
  }
}
