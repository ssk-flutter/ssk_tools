import 'package:flutter/material.dart';

import '../page/home/home_page.dart';
import '../page/text_compress/text_compress_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ssk tools',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/text-compress': (context) => const TextCompressPage(),
      },
    );
  }
}
