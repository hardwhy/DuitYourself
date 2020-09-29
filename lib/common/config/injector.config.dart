// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/screens/login/bloc/authentication/authentication_bloc.dart';
import '../network/cloud_function.dart';
import '../../presentation/screens/login/bloc/login/login_bloc.dart';
import '../models/menu.dart';
import '../../presentation/widgets/screen_layouts/menu/bloc/menu_bloc.dart';
import '../../domain/repositories/user_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../domain/usecases/user_usecase.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<CloudFunction>(() => FirebaseFunctionImpl());
  gh.factory<MenuBloc>(() => MenuBloc(getMenuRolesUsecase: get<Menu>()));
  gh.lazySingleton<UserRepository>(() => UserRepositoryImpl());
  gh.factory<UserUsecase>(() => UserUsecase(get<UserRepository>()));
  gh.factory<AuthenticationBloc>(() => AuthenticationBloc(get<UserUsecase>()));
  gh.factory<LoginBloc>(() => LoginBloc(get<UserUsecase>()));
  return get;
}
