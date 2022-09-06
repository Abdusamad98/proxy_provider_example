import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollableListExample extends StatefulWidget {
  const ScrollableListExample({Key? key}) : super(key: key);

  @override
  State<ScrollableListExample> createState() => _ScrollableListExampleState();
}

class _ScrollableListExampleState extends State<ScrollableListExample> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    itemPositionsListener.itemPositions.addListener(() {
      itemPositionsListener.itemPositions.value.forEach((element) {
        print(element.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Package"),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: 500,
        itemBuilder: (context, index) => buildMyItem(1, index),
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          itemScrollController.scrollTo(
              index: 100,
              duration: const Duration(seconds: 2),
              curve: Curves.linear);
        },
      ),
    );
  }

  Widget buildMyItem(int number, int index) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 50.0 * number,
      color: Colors.blue,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
