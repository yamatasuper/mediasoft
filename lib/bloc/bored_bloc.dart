import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/bored_use_case.dart';

part 'bored_event.dart';
part 'bored_state.dart';

class BoredBloc extends Bloc<BoredEvent, BoredState> {
  BoredBloc() : super(BoredInitial());

  @override
  Stream<BoredState> mapEventToState(BoredEvent event) async* {
    if (event is LoadingEvent) yield* mapLoadingEventToState();
  }

  Stream<BoredState> mapLoadingEventToState() async* {
    yield LoadingState();
    try {
      final data = await getBoredFromApi();
      yield LoadedState(data);
    } catch (e) {
      yield ErrorState();
    }
  }
}
