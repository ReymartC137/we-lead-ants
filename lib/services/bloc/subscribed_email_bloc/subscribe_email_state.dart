part of 'subscribe_email_bloc.dart';

abstract class SubscribeEmailState extends Equatable {
  const SubscribeEmailState();

  @override
  List<Object> get props => [];
}

class SubscribeEmailLoading extends SubscribeEmailState {}

class SubscribeEmailLoaded extends SubscribeEmailState {
  final Future<EmailSubscribedResponse> email;

  SubscribeEmailLoaded(this.email);
  @override
  List<Object> get props => [email];
}

class SubscribeEmailError extends SubscribeEmailState {
  final String error;

  SubscribeEmailError(this.error);
  @override
  List<Object> get props => [error];
}
