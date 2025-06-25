import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/login_model.dart';

part 'retrofit_api.g.dart';

//flutter pub run build_runner build
@RestApi(
  //baseUrl: "https://www.drdistributors.co.in/drd-live/flutter_api/Api01/")
  baseUrl: "https://www.drdistributor.com/flutter_api/Api01/",
)
abstract class MyApiService {
  factory MyApiService(Dio dio, {String baseUrl}) = _MyApiService;

  @POST("/get_login_api")
  @FormUrlEncoded()
  Future<LoginModelResponse> get_login_api(
    @Field("api_key") String api_key,
    @Field("user_name") String user_name,
    @Field("user_password") String user_password,
    @Field("firebase_token") String firebase_token,
  );

  @POST("/main_page_api")
  @FormUrlEncoded()
  Future<String> main_page_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("firebase_token") String firebase_token,
    @Field("device_id") String device_id,
    @Field("versioncode") String versioncode,
    @Field("getlatitude") String getlatitude,
    @Field("getlongitude") String getlongitude,
    @Field("gettime") String gettime,
    @Field("getdate") String getdate,
  );

  @POST("/home_page_api")
  @FormUrlEncoded()
  Future<String> home_page_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("seq_id") String seq_id,
  );

  @POST("/get_top_menu_api")
  @FormUrlEncoded()
  Future<String> get_top_menu_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
  );

  @POST("/medicine_search_api")
  @FormUrlEncoded()
  Future<String> medicine_search_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("keyword") String keyword,
    @Field("total_rec") String total_rec,
    @Field("checkbox_medicine") String checkbox_medicine,
    @Field("checkbox_company") String checkbox_company,
    @Field("checkbox_out_of_stock") String checkbox_out_of_stock,
  );

  // @POST("/medicine_details_api")
  // @FormUrlEncoded()
  // Future<MedicineDetailsResponse>  medicine_details_api(
  //     @Field("api_key") String api_key,
  //     @Field("user_type") String user_type,
  //     @Field("user_altercode") String user_altercode,
  //     @Field("user_password") String user_password,
  //     @Field("chemist_id") String chemist_id,
  //     @Field("user_nrx") String user_nrx,
  //     @Field("item_code") String item_code);

  @POST("/medicine_add_to_cart_api")
  @FormUrlEncoded()
  Future<String> medicine_add_to_cart_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("item_code") String item_code,
    @Field("item_order_quantity") String item_order_quantity,
    @Field("mobilenumber") String mobilenumber,
    @Field("modalnumber") String modalnumber,
    @Field("device_id") String device_id,
  );

  @POST("/medicine_delete_api")
  @FormUrlEncoded()
  Future<String> medicine_delete_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("item_code") String item_code,
  );

  @POST("/medicine_delete_all_api")
  @FormUrlEncoded()
  Future<String> medicine_delete_all_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
  );

  @POST("/place_order_api")
  @FormUrlEncoded()
  Future<String> place_order_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("device_id") String device_id,
    @Field("remarks") String remarks,
    @Field("latitude") String latitude,
    @Field("longitude") String longitude,
    @Field("mobilenumber") String mobilenumber,
    @Field("modalnumber") String modalnumber,
  );

  @POST("/my_cart_api")
  @FormUrlEncoded()
  Future<String> my_cart_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
  );

  @POST("/my_order_api")
  @FormUrlEncoded()
  Future<String> my_order_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("get_record") String get_record,
  );

  @POST("/my_order_details_api")
  @FormUrlEncoded()
  Future<String> my_order_details_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("item_id") String item_id,
  );

  @POST("/my_invoice_api")
  @FormUrlEncoded()
  Future<String> my_invoice_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("get_record") String get_record,
  );

  @POST("/my_invoice_details_api")
  @FormUrlEncoded()
  Future<String> my_invoice_details_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("item_id") String item_id,
  );

  @POST("/my_notification_api")
  @FormUrlEncoded()
  Future<String> my_notification_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("get_record") String get_record,
  );

  @POST("/my_notification_details_api")
  @FormUrlEncoded()
  Future<String> my_notification_details_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("item_id") String item_id,
  );

  @POST("/medicine_category_api")
  @FormUrlEncoded()
  Future<String> medicine_category_api(
    @Field("api_key") String api_key,
    @Field("user_type") String user_type,
    @Field("user_altercode") String user_altercode,
    @Field("user_password") String user_password,
    @Field("chemist_id") String chemist_id,
    @Field("user_nrx") String user_nrx,
    @Field("get_record") String get_record,
    @Field("item_page_type") String item_page_type,
    @Field("item_code") String item_code,
    @Field("item_division") String item_division,
  );
}
