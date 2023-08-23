import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData myTheme = ThemeData.light(useMaterial3: true)
      .copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: myTheme,
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(title: 'Theming Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Welocome to the Flutter Demo"),
            const Card(
              child: Column(children: [
                Text("Card Title"),
                Text("Card Content"),
              ]),
            ),
            FilledButton(onPressed: () {}, child: const Text("Filled Button")),
          ],
        ),
      ),
    );
  }
}
