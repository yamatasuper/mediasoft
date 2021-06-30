part of 'bored_bloc.dart';

abstract class BoredEvent extends Equatable {
  const BoredEvent();
}

class LoadingEvent extends BoredEvent {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}
