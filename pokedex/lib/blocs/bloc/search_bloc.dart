import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(BarraBuscadorOculta()) {
    on<MostrarBarraBuscador>((event, emit) {
      if(state is BarraBuscadorOculta){
        emit(BarraBuscadorVisible());
      } else{
        emit(BarraBuscadorOculta());
      }
    });
  }
}
