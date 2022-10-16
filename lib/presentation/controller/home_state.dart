import 'package:equatable/equatable.dart';
import 'package:google_map/core/utils/enum.dart';

class HomeState extends Equatable {
  final String id;
  final RequestState getIdState;
  final String getIdMessage;

  HomeState({
    this.id='',
    this.getIdState=RequestState.loading,
    this.getIdMessage='',
  });

  HomeState copyWith({
    String? id,
    RequestState? getIdState,
    String? getIdMessage,
}){
   return HomeState(
     id: id??this.id,
     getIdState: getIdState??this.getIdState,
     getIdMessage: getIdMessage??this.getIdMessage

   );

}

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,getIdState,getIdMessage
  ];
}
