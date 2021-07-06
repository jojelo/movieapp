//cargaremos las traduccines basadas en la condiguracion regional
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/common/constants/languages.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  //instancia de las localiaciones de la aplicacion
  static AppLocalizations of(context) => 
         Localizations.of<AppLocalizations>(context, AppLocalizations);

  //declaramos un mapa de cadena como clave y cadena como valor
  Map<String, String> _localizedStrings;

  //motodo para volver todo a falso
  Future<bool> load() async {
    //cargamos el json
    final jsonString = await rootBundle
          .loadString('assets/languages/${locale.languageCode}.json');
    
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  //funcion que devolvera el valor basado en la clave
  String translate(String key) {
    return _localizedStrings[key];
  }

  //agregamos el campo del delegado que contiene una instancia del delegado de localizacion de aplicaciones
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();
}

//las localizaciones de aplicaciones sobrescriben los tres metodos y devuelven
//falso desde el metodo de recarga,
class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations>{
  
  const _AppLocalizationDelegate();
  
  @override
  bool isSupported(Locale locale) {
    //anulamos metodos para controles seguros
    //que la configuracion regional que estamos cargando es compatible o no con la app
    //comprobara la configuracion regional seleccionada esta lista para nuestros locales
    return Languages.languages.map(
      (e) => e.code)
      .toList()
      .contains(locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale) async {
     AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }
  
  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
  
}