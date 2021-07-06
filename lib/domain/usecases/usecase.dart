//type: qué devuelve UseCase. (Salida)
//Parámetros: lo que se requiere para llamar a API. (Entrada)
import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}