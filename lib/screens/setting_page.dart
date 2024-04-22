import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:changelanguage/providers/language_provider.dart';
import 'package:changelanguage/providers/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class SettingPage extends HookWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check Language and Theme
    useEffect(() {
      final checkLanguage = Provider.of<LanguageProvider>(context, listen: false);
      checkLanguage.checkLanguage();
      final checkTheme = Provider.of<ThemeProvider>(context, listen: false);
      checkTheme.checkTheme();
      return () {};
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("setting".tr()),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<LanguageProvider>(
                builder: (context, lang, child) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("language".tr()),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: const Text("မြန်မာ"),
                              value: Language.mm,
                              groupValue: lang.lang,
                              onChanged: (value) {
                                context.setLocale(const Locale('my', 'MM'));
                                lang.changeLang(value!);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: const Text("English"),
                              value: Language.en,
                              groupValue: lang.lang,
                              onChanged: (value) {
                                context.setLocale(const Locale('en', 'US'));
                                lang.changeLang(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("theme".tr()),
                      ),
                    ],
                  );
                },
              ),
              Consumer<ThemeProvider>(
                builder: (context, theme, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: const Text("Light"),
                          value: Themes.light,
                          groupValue: theme.useTheme,
                          onChanged: (value) {
                            AdaptiveTheme.of(context).setLight();
                            theme.changeTheme(value!);
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: const Text("Dark"),
                          value: Themes.dark,
                          groupValue: theme.useTheme,
                          onChanged: (value) {
                            AdaptiveTheme.of(context).setDark();
                            theme.changeTheme(value!);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
