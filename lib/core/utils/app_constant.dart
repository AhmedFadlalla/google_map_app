import 'package:equatable/equatable.dart';


class AppConstant{
  static const baseUrl="https://maps.googleapis.com/maps/api/place/findplacefromtext/json";
  static const apiKey="AIzaSyCJdb-Jez2npnKJYRQ325BLZ1HZ-g4WXmA";
  static String getPlaceId(String input)=>"$baseUrl?input=$input&inputtype=textquery&key=$apiKey";
}


class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

