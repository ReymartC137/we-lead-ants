import 'package:bloc/bloc.dart';
import 'package:ants/services/data/models/email_subscribed_response.dart';
import 'package:ants/services/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'subscribe_email_event.dart';
part 'subscribe_email_state.dart';

class SubscribeEmailBloc
    extends Bloc<SubscribeEmailEvent, SubscribeEmailState> {
  SubscribeEmailBloc() : super(SubscribeEmailLoading()) {
    ChromaRepository chromaRepository = ChromaRepository();
    on<SubscribeNewEmailEvent>((event, emit) async {
      emit(SubscribeEmailLoading());
      try {
        final responseEmail = chromaRepository.subscribeEmail(event.email);
        emit(SubscribeEmailLoaded(responseEmail));
      } catch (e) {
        emit(SubscribeEmailError(e.toString()));
      }
    });
  }
}
