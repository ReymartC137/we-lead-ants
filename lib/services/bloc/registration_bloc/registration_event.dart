part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationLoadEvent extends RegistrationEvent {
  final String fname;
  final String lname;
  final String email;
  final String contact;
  final String password;

  RegistrationLoadEvent(
      {required this.fname,
      required this.lname,
      required this.email,
      required this.contact,
      required this.password});

  @override
  List<Object> get props => [fname, lname, email, contact, password];
}
