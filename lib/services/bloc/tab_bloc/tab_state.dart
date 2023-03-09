// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tab_bloc.dart';

class TabState extends Equatable {
  final double height;
  const TabState({
    required this.height,
  });

  @override
  List<Object> get props => [height];
}
