part of 'language_bloc.dart';

//import 'package:movieapp/domain/entities/language_entity.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

//evento que extiende el idioma 
class ToggleLanguageEvent extends LanguageEvent {
  //tomara la entidad del idioma cuando seleccionamos
  //un idiota especifico del cajon de navegacion
  final LanguageEntity language;

  const ToggleLanguageEvent(this.language);

  @override
  List<Object> get props => [language.code];
}