import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'responses/auth/sign_in_response.dart';
import 'api_response.dart';
import 'resquests/auth/sign_in_request.dart';

part 'api_service.g.dart';

class API {
  // ignore: constant_identifier_names
  static const String BASE_URL = 'https://api.themoviedb.org/3';

  static const String signIn = '/auth/signin';
}

@RestApi(baseUrl: API.BASE_URL + API.signIn)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        //'authorization': getIt<SharedPreferenceHelper>().getAuthToken,
      },
    );

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: true,
        requestBody: true,
      ));
    }
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST(API.signIn)
  Future<ApiResponse<SignInResponse>> signIn(@Body() SignInRequest request);
}
