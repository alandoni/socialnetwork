import 'package:flutter/material.dart';

class AppColors {
    static int primary = 0xff037afb;
    static Color backgroundColor = new Color(0xfff4f4f4);
    static Color borderColor = new Color(0xffcacaca);
    static Color textColor = new Color(0xff212529);
    static Color textFieldBorderColor = new Color(0xffced4da);
    static Color textFieldColor = new Color(0xff495057);
    static Color primaryColor = new Color(primary);
    static Color primaryTextColor = new Color(primary);
    static Color buttonColor = new Color(0xffffffff);
    static Color sectionBackgroundColor = new Color(0xfffefefe);
    static Color errorBackgroundColor = new Color(0xfff8d7da);
    static Color errorTextColor = new Color(0xff721c24);
    static Color errorBorderColor = new Color(0xfff5c6cb);
    static Color warningBackgroundColor = new Color(0xfffff3cd);
    static Color warningTextColor = new Color(0xff856404);
    static Color warningBorderColor = new Color(0xffffeeba);

    static MaterialColor primaryMaterialColor = MaterialColor(primary, AppColors.colorMap());

    static Map<int, Color> colorMap() {
      return {
         50: new Color(0xffe3f3fe),
        100: new Color(0xffbbe1fe),
        200: new Color(0xff8fceff),
        300: new Color(0xff61bbfe),
        400: new Color(0xff3aacff),
        500: new Color(primary),
        600: new Color(0xff008ff1),
        700: new Color(0xff007dde),
        800: new Color(0xff006bcc),
        900: new Color(0xff004dad),
      };
    }
}