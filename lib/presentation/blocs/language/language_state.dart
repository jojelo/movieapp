part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

//pasamos el estado del bloque de idioma eliminar el estado inicial ya que no es
//requerido aqui, usaremos el nuevo estado del estado en su lugar
//crear un idioma de estado cargado
//este estado extiende el estado del bloque de idioma
class LanguageLoaded extends LanguageState {
  //genemoramos una configuracion regional, asi que de un capo de apariencia y tipo
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object> get props => [locale.languageCode];
}
