part of 'movie_tabbed_bloc.dart';

//import 'package:equatable/equatable.dart';
//import 'package:movieapp/domain/entities/movie_entity.dart';

//actualizamos el estado abstracto para manejar el indice de la pestaña actual
//para administrar los estados en las pestañas activas
abstract class MovieTabbedState extends Equatable {
  //creamos indice de la pestaña actual 
  final int currentTabIndex;

  const MovieTabbedState({this.currentTabIndex});

  //si toca en la misma pestaña, no emitira el estado
  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState{}

//emitira el estado cambiando la pestaña
class MovieTabChanged extends MovieTabbedState {
  //alamcenamops la lista de peliculas
  final List<MovieEntity> movies;

  //contructor con la pestaña actual y pelicula
  const MovieTabChanged({int currentTabIndex, this.movies})
   : super(currentTabIndex: currentTabIndex);

   //asignar el indice de la españa actual y peliculas
   @override
   List<Object> get props => [currentTabIndex, movies];
}

//marcamos un error
class MovieTabLoadError extends MovieTabbedState{
  //error de carga de la pestaña
  const MovieTabLoadError({int currentTabIndex}) 
    : super(currentTabIndex: currentTabIndex);


}