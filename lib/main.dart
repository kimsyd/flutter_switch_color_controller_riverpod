import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope (
      child: const MyApp()
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Riverpod Color Controller',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Page(),
    );
  }
}

class Page extends ConsumerWidget {

  final colorStateProvider = StateProvider<Color>((ref) {
    Color color = Colors.orange;
    return color;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(colorStateProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("SK"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(
                    onPressed: () => {ref.read(colorStateProvider.notifier).state = Colors.primaries[Random().nextInt(Colors.primaries.length)]},
                    child: const Text('New Color'),
                  )
                ]
            )
        )
    );
  }
}
