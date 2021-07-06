import 'package:flutter/material.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashAPP extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashAPP({
    Key key,
    @required this.navigatorKey,
    @required this.child,
    @required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-app-tutorial-2g4vhdv',
      secret: 'azoizq70hoihoqrzkzs6ozi7y3uhvlvp',
      navigatorKey: navigatorKey,
      child: child,
      //el icono flotante desaparezca
      options: WiredashOptionsData(
        showDebugFloatingEntryPoint: false,
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
        dividerColor: AppColor.vulcan,
      ),
    );
  }
}
