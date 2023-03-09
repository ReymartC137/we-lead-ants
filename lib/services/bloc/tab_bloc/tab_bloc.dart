import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState(height: 2500)) {
    on<Tab1Event>((event, emit) {
      emit(TabState(height: event.tab));
    });
    on<Tab2Event>((event, emit) {
      emit(TabState(height: event.tab));
    });
    on<Tab3Event>((event, emit) {
      emit(TabState(height: event.tab));
    });
  }
}
