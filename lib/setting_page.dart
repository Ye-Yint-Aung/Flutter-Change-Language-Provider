import 'package:changelanguage/language_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class SettingPage extends HookWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // Check Language
      final checkLanguage = Provider.of<LanguageProvider>(context, listen: false);
      checkLanguage.checkLanguage();

      return () {};
    });
    //////////
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("language".tr()),
              ),
              Consumer<LanguageProvider>(
                builder: (context, lang, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          value: Language.mm,
                          groupValue: lang.lang,
                          onChanged: (value) {
                            context.setLocale(const Locale('my', 'MM'));

                            lang.changeLang(value!);
                          },
                          title: const Text("မြန်မာ"),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: Language.en,
                          groupValue: lang.lang,
                          onChanged: (value) {
                            context.setLocale(const Locale('en', 'US'));

                            lang.changeLang(value!);
                          },
                          title: const Text("English"),
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
