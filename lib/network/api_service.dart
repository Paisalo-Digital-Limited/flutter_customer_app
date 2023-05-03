import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl:"http://api.club75.in/api/")


abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return ApiService(dio);
  }





 /* @POST("users/verifymobileOTP/{ClubId}")
  Future<VerifyOtp> verifyOTP(
      @Field("MobileNo") mobileNo,
      @Field("OTP") otp,
      @Path("ClubId") hotelId,
      );

  @GET("GenerateMobileOTP/{mobile}/{ClubId}")
  Future<VerifyData> signUp(
      @Path("mobile") mobile,
      @Path("ClubId")hotelId,
      );*/
}