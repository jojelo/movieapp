import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extensions.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/movie_list_view_buildr.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  //use getter para obtener la instancia del bloque de tipo de peliculas de los antepasados
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  //declaramos el indice de la pestaña en 0
  //de forma predeterminada se mostrara la primera pestaña
  int currenTabIndex = 0;

  //cambio de evento para buscar las peliculas populares
  //ya que el estado de las pestañas y la vista cambia al tocar cualquier pestaña
  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currenTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        //padding para darle relleno vertical
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          //todas las pestañas en direccion horizontal
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //for para construir widgets en la matriz
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    //tomamos el titutlo de la funcion con el indice que enviara el evento
                    //de cambio de pestaña con el indice respectivo para decidir si la pestaña esta en el estado seleccionado o no
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTap: () => _onTapTapped(i),
                      //comparamos el indice del estado con el indice  de la pestaña
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    ),
                ],
              ),
              //debajo de las pestañas solo crearemos una vista de lista cuando carga la pelicula exitosamente
              if (state is MovieTabChanged)
              //la pestaña de la pelicula cambio de estado, asi que muertre la vista de lista en el widget expandido
              //para que tome el espacio diponible
              Expanded(
                child: MovieListViewBuilder(movies: state.movies),
              ),
            ],
          ),
        );
      },
    );
  }

  //pide al bloque con tipo de pelicula que envie el evento de cambio de petaña de pelicula
  //con el indice respectivo de inicio abierto
  void _onTapTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
