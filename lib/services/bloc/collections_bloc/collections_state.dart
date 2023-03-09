part of 'collections_bloc.dart';

abstract class CollectionsState extends Equatable {
  const CollectionsState();
}

class CollectionsLoadingState extends CollectionsState {
  @override
  List<Object?> get props => [];
}

class CollectionsLoadedState extends CollectionsState {
  final List<CollectionsModel> collectionsModel;

  const CollectionsLoadedState(this.collectionsModel);
  @override
  List<Object?> get props => [collectionsModel];
}

class CollectionsErrorState extends CollectionsState {
  final String error;

  const CollectionsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
