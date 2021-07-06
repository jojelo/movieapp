//esta case aceptara el repositorio de peliculas
import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository repository;

  GetPopular(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    //llamamos al metodo get trending del repositorio
    //esto devuelve la lista de peliculas abiertas en main.dart y esta a su vez
    //en lugar de llama a obtener tendencias de instancia de deposito
    return await repository.getPopular();

  }
}