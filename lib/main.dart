import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proxy_provider_example/listview_scrollable2.dart';
import 'package:proxy_provider_example/listview_scrollcontroller.dart';
import 'package:proxy_provider_example/scrollable_positioned_list.dart';


void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollableListExample(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
        {},
      ),
    );
  }
}
