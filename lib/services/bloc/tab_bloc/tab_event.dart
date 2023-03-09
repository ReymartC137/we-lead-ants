part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class Tab1Event extends TabEvent {
  final double tab;

  Tab1Event({required this.tab});
  @override
  List<Object> get props => [];
}

class Tab2Event extends TabEvent {
  final double tab;

  Tab2Event({required this.tab});
  @override
  List<Object> get props => [];
}

class Tab3Event extends TabEvent {
  final double tab;

  Tab3Event({required this.tab});
  @override
  List<Object> get props => [];
}
