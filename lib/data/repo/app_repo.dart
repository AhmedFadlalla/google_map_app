import 'package:dartz/dartz.dart';
import 'package:google_map/core/error/failure.dart';
import 'package:google_map/core/utils/constrant.dart';
import 'package:google_map/data/data_source/base_remote_data_source.dart';
import 'package:google_map/domain/repo/base_app_repo.dart';

class AppRepository extends BaseAppRepository{
  final BaseRemoteDataSource baseRemoteDataSource;


  AppRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, String>> getPlaceId(AppParameter parameter)async {
    final result=await  baseRemoteDataSource.getPlaceId(parameter);

    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

}