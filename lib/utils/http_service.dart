import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../model/api_exception.dart';
import '../model/response_model.dart';
import 'utils.dart';

enum MethodRequest { get, post, download }

class HttpService {
  static final Dio _dio = Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );

  static Future<Either<ApiException, dynamic>> request({
    String baseUrl = "",
    String endpoint = "",
    MethodRequest method = MethodRequest.get,
    dynamic data,
    bool isFormData = false,
    bool isFormUrlEncoded = false,
    String url = "",
    String savePath = "",
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      dynamic responseData;

      final response = method == MethodRequest.get
          ? await _dio.get(
              "${baseUrl.isNotEmpty ? baseUrl : AppApi.url}/$endpoint",
              data: data,
              queryParameters: queryParameters,
              options: Options(
                headers:
                    headers ??
                    await _getHttpHeaders(
                      isFormData: isFormData,
                      isFormUrlEncoded: isFormUrlEncoded,
                    ),
              ),
            )
          : method == MethodRequest.download
          ? await _dio.download(url, savePath, queryParameters: queryParameters)
          : await _dio.post(
              "${baseUrl.isNotEmpty ? baseUrl : AppApi.url}/$endpoint",
              data: data,
              queryParameters: queryParameters,
              options: Options(
                headers:
                    headers ??
                    await _getHttpHeaders(
                      isFormData: isFormData,
                      isFormUrlEncoded: isFormUrlEncoded,
                    ),
              ),
            );
      if (method == MethodRequest.download) {
        responseData = response.data;
      } else {
        responseData = response.data;
      }

      return right(responseData);
    } on DioException catch (e) {
      return Left(await _fromDioError(e));
    }
  }

  static Future<Map<String, String>> _getHttpHeaders({
    bool isFormData = false,
    bool isFormUrlEncoded = false,
  }) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: isFormData
          ? 'multipart/form-data'
          : isFormUrlEncoded
          ? 'application/x-www-form-urlencoded'
          : "application/json",
    };
    return headers;
  }

  static Future<ApiException> _fromDioError(DioException e) async {
    if (e.error is SocketException) {
      return ApiException(
        statusCode: e.response?.statusCode,
        message: "Anda tidak terhubung ke jaringan.",
      );
    }
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Koneksi ke server kehabisan waktu.",
        );

      case DioExceptionType.sendTimeout:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Waktu mengirim ke server kehabisan waktu.",
        );

      case DioExceptionType.receiveTimeout:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Waktu menerima data dari server kehabisan waktu.",
        );

      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 404) {
          return ApiException(
            statusCode: e.response?.statusCode,
            message: "${e.response?.statusCode}. Data tidak ditemukan",
          );
        }
        if ((e.response?.data is String &&
                (e.response?.data as String).contains("DOCTYPE")) ==
            true) {
          return ApiException(
            statusCode: e.response?.statusCode,
            message:
                "${e.response?.statusCode}. Kesalahan internal server, silahkan coba lagi nanti.",
          );
        }
        if (e.response?.data != null &&
            e.response?.data is Map<String, dynamic>) {
          final ResponseModel<dynamic> response = ResponseModel.fromJson(
            e.response?.data,
            (data) => [],
          );
          return ApiException(
            statusCode: e.response?.statusCode,
            message: response.message,
          );
        }
        return ApiException(
          statusCode: e.response?.statusCode,
          message:
              "${e.response?.statusCode != null ? "${e.response?.statusCode}. " : ""}Kesalahan internal server, silahkan coba lagi.",
        );
      case DioExceptionType.cancel:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Permintaan ke server dibatalkan.",
        );

      case DioExceptionType.unknown:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Kesalahan yang tidak terduga, silahkan coba lagi.",
        );

      case DioExceptionType.connectionError:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Kesalahan internal server, silahkan coba lagi.",
        );

      default:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Kesalahan yang tidak terduga, silahkan coba lagi.",
        );
    }
  }
}
