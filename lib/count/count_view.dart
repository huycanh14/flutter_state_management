import 'package:flutter/material.dart';

import '../stream/count_state.dart';

class CountView extends StatefulWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  State<CountView> createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {
  CountState countState = CountState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // bat buoc phai co ham huy
    countState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    countState.counterStream.listen((event) {
      print('count view published ' + event.toString());
      print('---------------');
    });

    countState.counterBehaviorStream.listen((event) {
      print('count view Behavior ' + event.toString());
      print('---------------');
    });
    return Column(
      children: [
        // StreamBuilder để đăng ký sự lắng nghe
        StreamBuilder(
            stream: countState.counterStream,
            // builder: (_context, AsyncSnapshot<int>snapshot) {
            builder: (_context, snapshot) {
              return Row(
                children: [
                  const Text("Count (publish)"),
                  Text(
                    snapshot.hasData ? snapshot.data.toString() : "0",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              );
            }),

        StreamBuilder(
            stream: countState.counterBehaviorStream,
            // builder: (_context, AsyncSnapshot<int>snapshot) {
            builder: (_context, snapshot) {
              return Row(
                children: [
                  const Text("Count (Behavior)"),
                  Text(
                    snapshot.hasData ? snapshot.data.toString() : "0",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              );
            }),
        StreamBuilder(
            stream: countState.counterReplayStream,
            builder: (_context, AsyncSnapshot<List<int>> snapshot) {
              return Row(
                children: [
                  const Text("Count (ReplaySubject)"),
                  Flexible(
                    child: Text(
                      snapshot.hasData ? snapshot.data.toString() : "0",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              );
            }),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () => countState.increment(),
          child: const Text('+'),
        ),
      ],
    );
  }
}
