//import 'package:equatable/equatable.dart';
part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

//evento que carga el carrusel de eventos
//extendemos el evento con la clase abstracta porque la definicion de bloc acepta el tipo de carrusel de peliculas.
//este evento se enviara cuando el usuario llega al indice predeterminado de la pantalla nos dara al flexibilidad
//para decidir que pelicula estara en el centro de la nuestro carrosul al principio
class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  //el contructor con indice predeterminado en 0 pasa
  const CarouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  //compraramos los estados del objeto carrusel
  @override
  List<Object> get props => [defaultIndex];
}
