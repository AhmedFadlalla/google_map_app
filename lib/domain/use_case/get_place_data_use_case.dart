import 'package:dartz/dartz.dart';
import 'package:google_map/core/error/failure.dart';
import 'package:google_map/core/use_case/base_use_case.dart';
import 'package:google_map/core/utils/constrant.dart';
import 'package:google_map/domain/repo/base_app_repo.dart';

class GetPlaceIdUseCase extends BaseUseCase<String, AppParameter>
{
  final BaseAppRepository baseAppRepository;


  GetPlaceIdUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, String>> call(AppParameter parameter) async{
    return baseAppRepository.getPlaceId(parameter);
  }

}