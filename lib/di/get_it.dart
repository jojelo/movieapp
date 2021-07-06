import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/data_sources/movie_remote_data_source.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_coming_soon.dart';
import 'package:movieapp/domain/usecases/get_playing_now.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
import 'package:movieapp/presentation/blocs/language/language_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  //iniciamos las llamadas de red
  //el cliente va obtener un objeto para registrar la funcion
  //devuelve el tipo de cliente y esto inicializa los datos
  //inicializa registerLazySingleton la instancia del cliente se usa por primera vez en la aplicacion
  //ahora el cliente API depende el cliente
  getItInstance.registerLazySingleton<Client>(() => Client());

  //obtenemos el metodo de instanci en el cliente api
  //obtener instancia resuelve la dependencia para el cliente api
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //fuente de datos remota de la pelicula de la instancia del cliente api depende del cliente api
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  //CASOS DE USO
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  //el repositorio de peliculas depende de la fuente de datos remota de la pelicula
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  //
  getItInstance.registerFactory(() => MovieBackdropBloc());

  //nueva instancia del bloc siempre que necesitemos del carrusel
  //ya que es una pantalla de inicio, primera pantalla
  getItInstance.registerLazySingleton(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getPopular: GetPopular(getItInstance()),
      getComingSoon: GetComingSoon(getItInstance()),
      getPlayingNow: GetPlayingNow(getItInstance()),
    ),
  );

  //LANGUAGE
  //puede ser singleton porque solo habra una entrada para este bloque en toda la aplicacion
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
