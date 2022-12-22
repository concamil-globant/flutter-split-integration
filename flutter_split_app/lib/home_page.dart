import 'package:flutter/material.dart';

import 'package:splitio/split_client.dart';
import 'package:splitio/splitio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // split var
  late Splitio _split;
  late SplitClient _client;

  @override
  void initState() {
    _split = Splitio('ci18mk0oocsbusvnahvg3g5aa9tpu3f3mdp8', 'KEY');
    _client = _split.client();
    super.initState();
  }

  @override
  void dispose() {
    _client.destroy();
    super.dispose();
  }

  Future<void> retrieveSplitValue() async {
    final String treatment = await _client.getTreatment('flutter_split_test');
    if (treatment == 'on') {
      /// Insert code here to show on treatment
    } else if (treatment == 'off') {
      /// Insert code here to show off treatment
    } else {
      /// Insert your control treatment code here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                retrieveSplitValue();
              },
              child: Container(
                color: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Text(
                  'Obtener Data desde Split',
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
