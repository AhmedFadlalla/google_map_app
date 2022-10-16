import 'package:equatable/equatable.dart';

class AppParameter extends Equatable{
   final String name ;


   AppParameter({
      required this.name,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [name];

}
