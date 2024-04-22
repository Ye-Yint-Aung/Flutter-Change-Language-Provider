import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:changelanguage/color_scheme.dart';
import 'package:changelanguage/screens/home.dart';
import 'package:changelanguage/providers/language_provider.dart';
import 'package:changelanguage/providers/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(
    EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [Locale('en', 'US'), Locale('my', 'MM')],
      fallbackLocale: Locale('en'),
      child: MyApp(savedThemeMode: savedThemeMode),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LanguageProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: MaterialApp(
          //
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          //
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme,
          themeMode: ThemeMode.system,
          darkTheme: darkTheme,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
