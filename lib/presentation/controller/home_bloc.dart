import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_map/core/utils/constrant.dart';
import 'package:meta/meta.dart';

import '../../core/utils/enum.dart';
import '../../domain/use_case/get_place_data_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<BaseHomeEvent, HomeState> {
  final GetPlaceIdUseCase getPlaceIdUseCase;

  HomeBloc(this.getPlaceIdUseCase) : super(HomeState()) {
    on<GetPlaceIdEvent>((event, emit) async {
      final result = await getPlaceIdUseCase(AppParameter(name: event.name));
      result.fold(
          (l) => emit(state.copyWith(
              getIdState: RequestState.error, getIdMessage: l.message)),
          (r) => emit(state.copyWith(id: r, getIdState: RequestState.loaded)));
    });
  }
}
