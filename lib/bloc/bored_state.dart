part of 'bored_bloc.dart';

abstract class BoredState extends Equatable {
  const BoredState();

  @override
  List<Object> get props => [];
}

class BoredInitial extends BoredState {}

class LoadingState extends BoredState {}

class ErrorState extends BoredState {}

class LoadedState extends BoredState {
  final data;
  const LoadedState(this.data);

  @override
  List<Object> get props => [data];
}
