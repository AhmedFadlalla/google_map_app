import 'package:google_map/core/error/exceptions.dart';
import 'package:google_map/core/network/error_message_model.dart';
import 'package:google_map/core/network/error_result_model.dart';
import 'package:google_map/core/utils/app_constant.dart';
import 'package:google_map/core/utils/constrant.dart';
import 'package:dio/dio.dart';
abstract class BaseRemoteDataSource {


  Future<String> getPlaceId(AppParameter parameter);
}

class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<String> getPlaceId(AppParameter parameter) async{
    final response=await Dio().get(AppConstant.getPlaceId(parameter.name));

    if(response.statusCode ==200){
      return response.data['candidates'][0]['place_id'] as String;
    }else{
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }


}