part of 'sustainability_bloc.dart';

abstract class SustainabilityState extends Equatable {
  const SustainabilityState();

  @override
  List<Object> get props => [];
}

class SustainabilityLoadingState extends SustainabilityState {}

class SustainabilityLoadedState extends SustainabilityState {
  final List<SustainabilityModel> sustainability;

  SustainabilityLoadedState(this.sustainability);
  @override
  List<Object> get props => [sustainability];
}

class SustainabilityErrorState extends SustainabilityState {
  final String error;

  SustainabilityErrorState(this.error);
  @override
  List<Object> get props => [error];
}
