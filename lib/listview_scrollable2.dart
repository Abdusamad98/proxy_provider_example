import 'package:flutter/material.dart';

class ListViewScrollable2 extends StatefulWidget {
  const ListViewScrollable2({Key? key}) : super(key: key);

  @override
  State<ListViewScrollable2> createState() => _ListViewScrollable2State();
}

class _ListViewScrollable2State extends State<ListViewScrollable2> {
  // final itemKey = GlobalKey();

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(scrollToIndex);
    super.initState();
  }

  void scrollToIndex() {
    double currentHeight = scrollController.position.pixels;
  }

  // Future<void> scrollToPosition() async {
  //   var context = itemKey.currentContext;
  //   await Scrollable.ensureVisible(
  //     context!,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview Scrollable"),
      ),
      body: ListView(
        controller: scrollController,
        children: [
          ...List.generate(100, (index) => buildMyItem(1, index)),
          // Container(color: Colors.red, key: itemKey, child: buildMyItem(2)),
          // buildMyItem(2),
          // buildMyItem(3),
          // buildMyItem(5),
          // buildMyItem(4),
          // buildMyItem(6),
          // buildMyItem(3),
          // buildMyItem(2),
          // buildMyItem(3),
          // buildMyItem(5),
          // buildMyItem(4),
          // buildMyItem(6),
          // buildMyItem(3),
          // buildMyItem(2),
          // buildMyItem(3),
          // buildMyItem(5),
          // buildMyItem(4),
          // buildMyItem(6),
          // buildMyItem(3),
          // buildMyItem(2),
          // buildMyItem(3),
          // buildMyItem(5),
          // buildMyItem(4),
          // buildMyItem(6),
          // buildMyItem(3),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.account_balance_wallet_sharp),
        onPressed: () {
          scrollController.animateTo(50 * 25,
              duration: Duration(seconds: 1), curve: Curves.bounceIn);
        },
      ),
    );
  }

  Widget buildMyItem(int number, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 50.0 * number,
      color: Colors.blue,
      child: Center(
          child: Text(
        index.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 22),
      )),
    );
  }
}
