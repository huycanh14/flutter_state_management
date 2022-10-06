import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/count_state.dart';

class CountView extends StatefulWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  State<CountView> createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {
  late int countRead;
  late int countReadProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countRead = context.read<CountState>().countRead;
    countReadProvider = Provider.of<CountState>(context, listen: false).countRead;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Watch"),
            Text(
              '${context.watch<CountState>().count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        Row(
          children: [
            const Text("Read"),
            Text(
              '$countRead',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        Row(
          children: [
            const Text("Select"),
            Text(
              '${context.select((CountState p) => p.countRead)}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        Row(
          children: [
            const Text("Provider, listen: true"),
            Text(
              '${Provider.of<CountState>(context, listen: true).countRead}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        Row(
          children: [
            const Text("Provider, listen: false"),
            Text(
              '$countReadProvider',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ],
    );
  }
}
