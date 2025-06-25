// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _MyApiService implements MyApiService {
  _MyApiService(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://www.drdistributor.com/flutter_api/Api01/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<LoginModelResponse> get_login_api(
    String api_key,
    String user_name,
    String user_password,
    String firebase_token,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_name': user_name,
      'user_password': user_password,
      'firebase_token': firebase_token,
    };
    final _options = _setStreamType<LoginModelResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/get_login_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LoginModelResponse _value;
    try {
      _value = LoginModelResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> main_page_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String firebase_token,
    String device_id,
    String versioncode,
    String getlatitude,
    String getlongitude,
    String gettime,
    String getdate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'firebase_token': firebase_token,
      'device_id': device_id,
      'versioncode': versioncode,
      'getlatitude': getlatitude,
      'getlongitude': getlongitude,
      'gettime': gettime,
      'getdate': getdate,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/main_page_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> home_page_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String seq_id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'seq_id': seq_id,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/home_page_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> get_top_menu_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/get_top_menu_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> medicine_search_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String keyword,
    String total_rec,
    String checkbox_medicine,
    String checkbox_company,
    String checkbox_out_of_stock,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'keyword': keyword,
      'total_rec': total_rec,
      'checkbox_medicine': checkbox_medicine,
      'checkbox_company': checkbox_company,
      'checkbox_out_of_stock': checkbox_out_of_stock,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/medicine_search_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> medicine_add_to_cart_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String item_code,
    String item_order_quantity,
    String mobilenumber,
    String modalnumber,
    String device_id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'item_code': item_code,
      'item_order_quantity': item_order_quantity,
      'mobilenumber': mobilenumber,
      'modalnumber': modalnumber,
      'device_id': device_id,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/medicine_add_to_cart_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> medicine_delete_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String item_code,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'item_code': item_code,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/medicine_delete_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> medicine_delete_all_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/medicine_delete_all_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> place_order_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String device_id,
    String remarks,
    String latitude,
    String longitude,
    String mobilenumber,
    String modalnumber,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'device_id': device_id,
      'remarks': remarks,
      'latitude': latitude,
      'longitude': longitude,
      'mobilenumber': mobilenumber,
      'modalnumber': modalnumber,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/place_order_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> my_cart_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/my_cart_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> my_order_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String get_record,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'get_record': get_record,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/my_order_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> my_order_details_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String item_id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'item_id': item_id,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/my_order_details_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> my_invoice_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String get_record,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'get_record': get_record,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/my_invoice_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> my_invoice_details_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String item_id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'item_id': item_id,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/my_invoice_details_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> my_notification_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String get_record,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'get_record': get_record,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/my_notification_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> my_notification_details_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String item_id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'item_id': item_id,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/my_notification_details_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> medicine_category_api(
    String api_key,
    String user_type,
    String user_altercode,
    String user_password,
    String chemist_id,
    String user_nrx,
    String get_record,
    String item_page_type,
    String item_code,
    String item_division,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_type': user_type,
      'user_altercode': user_altercode,
      'user_password': user_password,
      'chemist_id': chemist_id,
      'user_nrx': user_nrx,
      'get_record': get_record,
      'item_page_type': item_page_type,
      'item_code': item_code,
      'item_division': item_division,
    };
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/medicine_category_api',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
