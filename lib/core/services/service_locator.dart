
import 'package:get_it/get_it.dart';
import 'package:google_map/data/data_source/base_remote_data_source.dart';
import 'package:google_map/data/repo/app_repo.dart';
import 'package:google_map/domain/repo/base_app_repo.dart';

import '../../domain/use_case/get_place_data_use_case.dart';
import '../../presentation/controller/home_bloc.dart';


final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc
    sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case

    sl.registerLazySingleton<GetPlaceIdUseCase>(() =>GetPlaceIdUseCase(sl()) );
    //Repository
    sl.registerLazySingleton<BaseAppRepository>(() =>AppRepository(sl()) );
    //data source

    sl.registerLazySingleton<BaseRemoteDataSource>(() =>RemoteDataSource() );
  }

}