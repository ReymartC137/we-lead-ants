import 'package:ants/services/data/models/registration_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/repositories.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationLoadingState()) {
    ChromaRepository chromaRepository = ChromaRepository();
    on<RegistrationLoadEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      try {
        final response = await chromaRepository.register(event.fname,
            event.lname, event.email, event.contact, event.password);
        emit(RegistrationLoadedState(response));
      } catch (e) {
        emit(RegistrationErrorState(e.toString()));
      }
    });
  }
}
