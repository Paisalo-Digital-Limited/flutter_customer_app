import 'package:dio/dio.dart';
import 'package:flutter_customer_app/models/loandata.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../models/signupdata.dart';

part 'api_service.g.dart';

@RestApi(baseUrl:"https://erpservice.paisalo.in:980/PDL.Mobile.Api/api/")


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

  @POST("UserMobile/CreateCustomerRegistration")
  Future<Signupdata> signUp(
      @Field("name") name,
      @Field("phoneNO") phoneNO,
      @Field("password") password,
      );

  @GET("UserMobile/LoginCheck")
  Future<Signupdata> login(
      @Query("Phone") String  phoneNO,
      @Query("Pass") String  password,
      );

  @POST("UserMobile/UpdateLoanNoInCustomerRegistration")
  Future<Signupdata> loanMapped(
      @Query("Id") String  id,
      @Query("LoanNo") String  loanNo,
      );


  @GET("UserMobile/LoanUserDetails")
  Future<Loandata> loandata(
      @Query("LoanActNo") String  loanActNo,
      );
}