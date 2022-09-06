import 'package:flutter/material.dart';

class TextListenerExample extends StatefulWidget {
  const TextListenerExample({Key? key}) : super(key: key);

  @override
  State<TextListenerExample> createState() => _TextListenerExampleState();
}

class _TextListenerExampleState extends State<TextListenerExample> {
  final TextEditingController myController = TextEditingController();
  String cardName = "";

  void _printLatestValue() {
    if (myController.text.length > 4) {
      String firstFourSymbols = myController.text.substring(0, 4);
      if (firstFourSymbols == '8600') {
        cardName = "Uzcard";
      } else if (firstFourSymbols == "9860") {
        cardName = "Humo";
      }
    } else {
      cardName = "";
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(cardName),
            TextField(
              keyboardType: TextInputType.number,
              controller: myController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("Button"),
        onPressed: () => {},
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
