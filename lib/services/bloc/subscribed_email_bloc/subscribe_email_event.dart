// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'subscribe_email_bloc.dart';

abstract class SubscribeEmailEvent extends Equatable {
  const SubscribeEmailEvent();

  @override
  List<Object> get props => [];
}

class SubscribeNewEmailEvent extends SubscribeEmailEvent {
  String email;
  SubscribeNewEmailEvent({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}
