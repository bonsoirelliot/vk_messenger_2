import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vk_messenger_2/static/static_data.dart';
import 'package:path_provider/path_provider.dart' as pp;

class RequestHandler {
  CacheOptions? cacheOptions;

  static CookieManager? _cookieManager;
  static CacheStore? _store;
  static bool _storeCreating = false;

  Dio? _dio;

  RequestHandler._init({String? baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? StaticData.baseUrl,
        connectTimeout: 20000,
        receiveTimeout: 40000,
      ),
    );
  }

  factory RequestHandler({String? baseUrl}) {
    final handler = RequestHandler._init(baseUrl: baseUrl);

    try {
      if (_store == null && !_storeCreating) {
        _storeCreating = true;

        pp.getApplicationDocumentsDirectory().then((dir) {
          _store = DbCacheStore(
            databasePath: dir.path,
            logStatements: true,
            databaseName: 'cache',
          );

          handler.cacheOptions = CacheOptions(
            store: _store,
            policy: CachePolicy.noCache,
          );

          handler._dio?.interceptors.add(
            DioCacheInterceptor(options: handler.cacheOptions!),
          );

          _cookieManager = CookieManager(
            PersistCookieJar(
              storage: FileStorage(dir.path),
            ),
          );

          handler._dio?.interceptors.add(_cookieManager!);

          _storeCreating = false;
        });
      } else if (!_storeCreating) {
        handler.cacheOptions = CacheOptions(
          store: _store,
          policy: CachePolicy.noCache,
        );

        handler._dio?.interceptors.add(
          DioCacheInterceptor(options: handler.cacheOptions!),
        );

        handler._dio?.interceptors.add(_cookieManager!);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    return handler;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    // Options? options,
    // CancelToken? cancelToken,
    // void Function(int, int)? onReceiveProgress,
  }) async {
    late Response<T> res;

    if (_dio?.interceptors != null && _dio!.interceptors.isNotEmpty) {
      if (_cookieManager != null) {
        _dio!.interceptors.add(_cookieManager!);
      }
    }

    if (_cookieManager != null) {
      await _cookieManager!.cookieJar
          .loadForRequest(Uri.parse(StaticData.baseUrl + path));
    }

    //debugPrint('userToken ${_userWM?.userData.value.data?.user.token}');

    try {
      var prefs = await SharedPreferences.getInstance();
      if (queryParameters != null) {
        queryParameters.addAll(<String, dynamic>{
          'access_token': prefs.getString('user_token'),
        });
      }
      res = await _dio!.get(
        path,
        // cancelToken: cancelToken,
        // onReceiveProgress: onReceiveProgress,
        // options: options != null
        //     ? options.copyWith(
        //         headers: <String, dynamic>{
        //           'x-api-key': options.headers?.containsKey('x-api-key') != null
        //               ? options.headers != null
        //                   ? options.headers!['x-api-key']
        //                   : ''
        //               : _userWM?.userData.value.data?.user.token ?? '',
        //         },
        //       )
        //     : Options(
        //         headers: <String, dynamic>{
        //           if (_userWM?.userData.value.data?.user.token != null)
        //             'x-api-key': _userWM?.userData.value.data?.user.token,
        //         },
        //       ),
        queryParameters: queryParameters ??
            <String, dynamic>{
              'access_token': prefs.getString('user_token'),
            },
      );
    } on DioError catch (e) {
      final result = e.response;

      debugPrint('statusCode: ${result?.statusCode}');

      // if ((result?.statusCode == 401 || result?.statusCode == 403) &&
      //     globalContext != null) {
      //   Provider.of<AuthWM>(globalContext!, listen: false).logout();
      // }

      rethrow;
    }

    return res;
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    // Options? options,
    // CancelToken? cancelToken,
    // void Function(int, int)? onSendProgress,
    // void Function(int, int)? onReceiveProgress,
  }) async {
    //debugPrint(UserRepository.currentUser?.token);

    late Response<T> res;

    if (_cookieManager != null) {
      await _cookieManager!.cookieJar
          .loadForRequest(Uri.parse(StaticData.baseUrl + path));
    }

    try {
      res = await _dio!.post(
        path,
        data: data,
        queryParameters: queryParameters,
        // options: options != null
        //     ? options.copyWith(
        //         headers: <String, dynamic>{
        //           'x-api-key': options.headers?.containsKey('x-api-key') != null
        //               ? options.headers != null
        //                   ? options.headers!['x-api-key']
        //                   : ''
        //               : _userWM?.userData.value.data?.user.token ?? '',
        //         },
        //       )
        //     : Options(
        //         headers: <String, dynamic>{
        //           if (_userWM?.userData.value.data?.user.token != null)
        //             'x-api-key': _userWM?.userData.value.data?.user.token,
        //         },
        //       ),
        // cancelToken: cancelToken,
        // onSendProgress: onSendProgress,
        // onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      final result = e.response;

      debugPrint('statusCode: ${result?.statusCode}');

      // if ((result?.statusCode == 401 || result?.statusCode == 403) &&
      //     globalContext != null) {
      //   Provider.of<AuthWM>(globalContext!, listen: false).logout();
      // }

      rethrow;
    }

    return res;
  }
}
