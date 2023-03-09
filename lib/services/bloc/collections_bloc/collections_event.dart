part of 'collections_bloc.dart';

abstract class CollectionsEvent extends Equatable {
  const CollectionsEvent();
}

class LoadCollectionsEvent extends CollectionsEvent {
  @override
  List<Object?> get props => [];
}
