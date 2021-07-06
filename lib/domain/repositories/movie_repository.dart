//creamos un repositorio de peliculas
import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';

abstract class MovieRepository{
  //devolvemos el futuro de la lista de peliculas, con nombre tendencia
  //Future<List<MovieEntity>> getTrending();
  
  //marcamos el error
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();

}

//el paquete dartz importado trae a la derecha los errores y izquierda exitos(portador de obajetos)