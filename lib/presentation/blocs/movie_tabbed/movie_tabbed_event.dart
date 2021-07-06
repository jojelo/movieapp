part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

//se extendera para mantener el indice y crearemos una variable
//para crear mas pestañas mas adelante
class MovieTabChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  //constructo para mantener la pestaña actual en el indice 0
  const MovieTabChangedEvent({this.currentTabIndex = 0});

  //usamos el indice actual del metoto de accesorios para que
  //el evento nose envie cuando se cambia a la misma pestaña
  @override
  List<Object> get props => [currentTabIndex];
}

