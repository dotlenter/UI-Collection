// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../helper/theme/theme_helper.dart' as _i9;
import '../modules/_master/domain/bloc/master_page_bloc.dart' as _i4;
import '../modules/schedule/domain/bloc/schedule_bloc.dart' as _i7;
import 'factories/register_module.dart' as _i11;
import 'http/http_client.dart' as _i10;
import 'http/json_http_request_interceptor.dart' as _i3;
import 'http/multipart_http_request_interceptor.dart' as _i5;
import 'http/remote_exception_handler.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyRegisterModule = _$ThirdPartyRegisterModule();
  gh.factory<_i3.JsonHttpRequestInterceptor>(
      () => _i3.JsonHttpRequestInterceptor());
  gh.factory<_i4.MasterPageBloc>(() => _i4.MasterPageBloc());
  gh.factory<_i5.MultipartHttpRequestInterceptor>(
      () => _i5.MultipartHttpRequestInterceptor());
  gh.factory<_i6.RemoteExceptionHandler>(() => _i6.RemoteExceptionHandler());
  gh.factory<_i7.ScheduleBloc>(() => _i7.ScheduleBloc());
  await gh.factoryAsync<_i8.SharedPreferences>(
      () => thirdPartyRegisterModule.sharedPreferences,
      preResolve: true);
  gh.factory<_i9.ThemeHelper>(() => _i9.ThemeHelper());
  gh.factory<_i10.HttpClient>(() => _i10.HttpClient(
      jsonHttpRequestInterceptor: get<_i3.JsonHttpRequestInterceptor>(),
      multipartHttpRequestInterceptor:
          get<_i5.MultipartHttpRequestInterceptor>()));
  return get;
}

class _$ThirdPartyRegisterModule extends _i11.ThirdPartyRegisterModule {}
