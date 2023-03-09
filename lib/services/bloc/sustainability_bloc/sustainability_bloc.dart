import 'package:bloc/bloc.dart';
import 'package:ants/services/data/models/sustainability_model.dart';
import 'package:ants/services/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'sustainability_event.dart';
part 'sustainability_state.dart';

class SustainabilityBloc
    extends Bloc<SustainabilityEvent, SustainabilityState> {
  final ChromaRepository chromaRepository;
  SustainabilityBloc(this.chromaRepository)
      : super(SustainabilityLoadingState()) {
    on<LoadSustainabilityEvent>((event, emit) async {
      emit(SustainabilityLoadingState());
      try {
        final sustainability =
            await chromaRepository.getSustainabilityArticle();
        print("::::" + sustainability.toString());
        emit(SustainabilityLoadedState(sustainability));
      } catch (e) {
        emit(SustainabilityErrorState(e.toString()));
      }
    });
  }
}
