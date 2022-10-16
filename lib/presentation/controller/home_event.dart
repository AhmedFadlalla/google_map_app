import 'package:equatable/equatable.dart';

abstract class BaseHomeEvent extends Equatable{

  BaseHomeEvent();

  @override
  List<Object?> get props => [];
}

class GetPlaceIdEvent extends BaseHomeEvent{
  final String name;

  GetPlaceIdEvent(this.name);
}
