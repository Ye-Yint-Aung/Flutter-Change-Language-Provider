import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Language")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(LocaleKeys.title.tr()),
        const SizedBox(
          height: 10,
        ),
        Text(LocaleKeys.message.tr()),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("English"),
              onPressed: () {
                setState(() {
                  context.setLocale(const Locale("en", "US"));
                });
              },
            ),
            ElevatedButton(
              child: const Text("Myanmar"),
              onPressed: () {
                setState(() {
                  context.setLocale(const Locale("my", "MM"));
                });
              },
            )
          ],
        )
      ]),
    );
  }
}
