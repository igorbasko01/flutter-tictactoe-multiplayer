import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Expanded(
                    flex: 1,
                    child: Center(
                        child: Text("Welcome to the game of Tic Tac Toe!"))),
                Expanded(flex: 3, child: _board()),
                const Expanded(flex: 1, child: Text("Player X's turn")),
              ],
            )));
  }

  Widget _board() {
    return AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    log("Tapped on cell $index");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 5, color: Colors.blue),
                        color: Colors.white),
                    child: const Center(
                        child: Text('',
                            style:
                                TextStyle(fontSize: 64, color: Colors.blue))),
                  ));
            }));
  }
}
