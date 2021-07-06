part of 'movie_carousel_bloc.dart';

//import 'package:equatable/equatable.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

//primer estado cuando el bloc se inicializa
class MovieCarouselInitial extends MovieCarouselState {}

//se emitira un error de carrusel de peliculas si hay un error desde la api
class MovieCarouselError extends MovieCarouselState {}

//carrusel cargado esto emitira una lita de tendencia e indice predeterminado
class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({
    this.movies,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [movies, defaultIndex];
}
