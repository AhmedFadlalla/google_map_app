import 'package:dartz/dartz.dart';
import 'package:google_map/core/utils/constrant.dart';

import '../../core/error/failure.dart';

abstract class BaseAppRepository {

  Future<Either<Failure,String>> getPlaceId(AppParameter parameter);

}