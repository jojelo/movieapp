import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movieapp/common/constants/languages.dart';
import 'package:movieapp/common/screenutil/screenutil.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/app_localizations.dart';
import 'package:movieapp/presentation/blocs/language/language_bloc.dart';
import 'package:movieapp/presentation/journeys/home/home_screen.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';
import 'package:movieapp/presentation/wiredash_app.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  //declaramos la variagle del bloque de idioma
  LanguageBloc _languageBloc;

  //obtenemos la instancia del bloque de idioma
  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //inicializamos la pantalla util para que se adecue segun el mobil que usas
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          //el estado del idioma solo tiene un estado de idioma cargado
          if (state is LanguageLoaded) {
            return WiredashAPP(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                  primaryColor: AppColor.vulcan,
                  accentColor: AppColor.royalBlue,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                //en lugar de tomar la configuracion regional de uno de los idiomas,
                //tomalo del estado, ahora cuando el estado cambia 
                //la configuracion regional tambien cambiara y actualizara todas las cadenas en el aplicacion
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  //este es para los widgets de material
                  GlobalMaterialLocalizations.delegate,
                  //cualquier otro widget
                  GlobalMaterialLocalizations.delegate
                ],
                home: HomeScreen(),
              ),
            );
          }
          //cuando el estado no esta cargado de idioma, puede devolver un cuadro de tamaño
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
