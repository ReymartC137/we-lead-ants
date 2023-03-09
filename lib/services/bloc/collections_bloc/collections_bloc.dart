import 'package:bloc/bloc.dart';
import 'package:ants/services/data/models/collections_model.dart';
import 'package:ants/services/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'collections_event.dart';
part 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final CollectionsRepository collectionsRepository;
  CollectionsBloc(this.collectionsRepository)
      : super(CollectionsLoadingState()) {
    on<LoadCollectionsEvent>((event, emit) async {
      emit(CollectionsLoadingState());
      final collection = await collectionsRepository.getCollection();
      print(collection);
      emit(CollectionsLoadedState(collection));
      try {} catch (e) {
        emit(CollectionsErrorState(e.toString()));
      }
    });
  }
}
