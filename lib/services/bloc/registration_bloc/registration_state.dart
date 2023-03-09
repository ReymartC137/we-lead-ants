part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationLoadedState extends RegistrationState {
  final RegistrationResponse response;

  RegistrationLoadedState(this.response);
  @override
  List<Object> get props => [response];
}

class RegistrationErrorState extends RegistrationState {
  final String error;

  RegistrationErrorState(this.error);
  @override
  List<Object> get props => [error];
}
