import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData myTheme = ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepOrange,
        primary: Colors.brown[900],
        surface: Colors.brown[200],
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
        headlineMedium: ThemeData.light().textTheme.headlineMedium?.copyWith(
          color: Colors.brown[900],
        )
      ).apply(fontFamily: GoogleFonts.concertOne().fontFamily));
  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.light(useMaterial3: true),
      theme: myTheme,
      //2
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeMode,
      home: MyHomePage(title: 'Theming Demo', onToggleTheme: toggleTheme),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage(
      {super.key, required this.title, required this.onToggleTheme});

  final VoidCallback onToggleTheme;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: [
        IconButton(
          onPressed: onToggleTheme,
          icon: const Icon(Icons.brightness_6),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             Text(
              "Welcome to the Flutter Demo",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'Section 1',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Divider(),
            Card(
              child: Column(children: [
                Text(
                  "Card Title",
                  style:
                      Theme.of(context).textTheme.headlineMedium,
                ),
                 Text("Card Content", style: Theme.of(context).textTheme.bodyLarge,),
              ]),
            ),
            TextButton.icon(
                onPressed: () async {
                  await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                },
                icon: const Icon(Icons.more_time),
                label: const Text("Pick Time")),
            FilledButton(onPressed: () {}, child: const Text("Filled Button")),
          ],
        ),
      ),
    );
  }
}
