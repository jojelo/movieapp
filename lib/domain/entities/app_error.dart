import 'package:equatable/equatable.dart';

//esta clase contentra cualquier mensaje de error
class AppError extends Equatable {
  final String message;

  const AppError(this.message);

  @override
  // sobrescribira el metodo de accesorios para mantener el mensaje si es necesario
  List<Object> get props => [message];
}