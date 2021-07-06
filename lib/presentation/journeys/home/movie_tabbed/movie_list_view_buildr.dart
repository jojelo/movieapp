import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/common/extensions/size_extensions.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';

//widget sin estado que requiere una lista de peliculas
class MovieListViewBuilder extends StatelessWidget {

  final List<MovieEntity> movies;

  const MovieListViewBuilder({
    Key key, 
    @required this.movies
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //padding para dar espacio entre la parte superior e inferior
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: movies.length,
        //direccion de desplazamiento horizontal
        scrollDirection: Axis.horizontal,
        //devolvemos un cuadro de cierto tamaño de ancho
        separatorBuilder: (context, index) {
          return SizedBox(width: 14.w);
        },
        //buscamos una sola pelicula y devolvemos la tarjeta
        itemBuilder: (context, index){
          final MovieEntity movie = movies[index];
          return MovieTabCardWidget(
            movieId: movie.id,
            title: movie.title,
            posterPath: movie.posterPath,
          );
        }, 
        
        
      ),
    );
  }
}