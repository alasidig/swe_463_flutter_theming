import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final ThemeData myTheme = ThemeData.from(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: Colors.orange,
      ));
  ThemeMode themeMode = ThemeMode.system;
  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeMode,
      home:  MyHomePage(title: 'Theming Demo', onToggleTheme: toggleTheme),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title, required this.onToggleTheme});
  final VoidCallback onToggleTheme;

  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: const Icon(Icons.brightness_6),
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Welocome to the Flutter Demo",
            ),
            Card(
              child: Column(children: [
                Text(
                  "Card Title",
                  // style:
                  //     TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Text("Card Content"),
              ]),
            ),
            // const Text(
            //   "Sports Section",
            // ),
            // Theme(
            //   data: Theme.of(context).copyWith(
            //     colorScheme: ColorScheme.fromSeed(
            //       seedColor: Colors.green,
            //     )
            //   ),
            //   child: Builder(
            //     builder: (ctx) {
            //       return Card(
            //         child: Column(children: [
            //           Text(
            //             "Sport Title",
            //             style:
            //                 TextStyle(color: Theme.of(ctx).colorScheme.primary),
            //           ),
            //           Text("Sport Content"),
            //         ]),
            //       );
            //     }
            //   ),
            // ),
            FilledButton(onPressed: () {}, child: const Text("Filled Button")),
          ],
        ),
      ),
    );
  }
}
