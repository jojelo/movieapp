import 'package:flutter/material.dart';
import 'package:movieapp/presentation/app_localizations.dart';

extension StringExtension on String {
  String intelliTrim() {
    //la cadena de caracteres si es mas de 15 entonces los completa los 3 puntos
    //sino muestra la cadena completa
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  
  //metodo t que reemplazara la calve en el motodo de traduccion
  String t(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
