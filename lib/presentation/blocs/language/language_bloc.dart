import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/common/constants/languages.dart';
import 'package:movieapp/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  //pasar en el estado cargado el idioma tomar el primer idiota que es ingles
  LanguageBloc()
    : super(
      LanguageLoaded(
        Locale(Languages.languages[0].code),
      ),
    );

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      //por ahora usa el codigo de idioma proveniente del evento para crear el estado y ceder ese estado
      yield LanguageLoaded(Locale(event.language.code));
    }
  }
}
