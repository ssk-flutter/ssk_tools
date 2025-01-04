import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Spacer(),
        Center(child: Text('SSK Tools')),
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/text-compress');
          },
          child: Text('Text Compress'),
        ),
        Spacer(),
      ],
    ));
  }
}
