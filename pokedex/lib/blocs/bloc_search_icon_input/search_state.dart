part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class BarraBuscadorOculta extends SearchState {}
final class BarraBuscadorVisible extends SearchState {}
