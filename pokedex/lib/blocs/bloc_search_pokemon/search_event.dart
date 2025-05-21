part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class MostrarBarraBuscador extends SearchEvent {}
class OcultarBarraBuscador extends SearchEvent {}
