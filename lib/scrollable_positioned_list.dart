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

   Widget myWidget = Wrap(
    direction: Axis.vertical,
   spacing: 10,
    runSpacing: 10,
    children: [
      Container(
        width: 200,height: 200,color: Colors.red,),
      Container(width: 300,height: 400,color: Colors.red,),
      Container(width: 100,height: 50,color: Colors.red,),
      Container(width: 200,height: 50,color: Colors.red,)
    ],
  );

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
      body: myWidget,
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
