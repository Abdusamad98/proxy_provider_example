import 'package:flutter/material.dart';

class ListviewScrollController extends StatefulWidget {
  const ListviewScrollController({Key? key}) : super(key: key);

  @override
  State<ListviewScrollController> createState() =>
      _ListviewScrollControllerState();
}

class _ListviewScrollControllerState extends State<ListviewScrollController> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(printCurrentScrolledPosition);
    super.initState();
  }


  void printCurrentScrolledPosition() {
   if(scrollController.position.pixels == 0){
     print("Top");
   }else if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
     print("Bottom");
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scroll Controller"),
      ),
      body: ListView.builder(
        itemCount: 100,
        controller: scrollController,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              index.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () {
                scrollController.jumpTo(
                  scrollController.position.minScrollExtent,
                  // duration: const Duration(seconds: 1),
                  // curve: Curves.easeIn,
                );
              },
              child: const Text("Up")),
          ElevatedButton(
              onPressed: () {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent/2,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                );
              },
              child: const Text("Center")),
          ElevatedButton(onPressed: () {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
            );
          }, child: const Text("Down")),
        ],
      ),
    );
  }
}
