import 'package:flutter/material.dart';

import 'cubit/count_cubit.dart';

class CountView extends StatefulWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  State<CountView> createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {
  final cubit = CountCubit();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Column(
            children: [
              if (cubit.state is CountInitial) ...[
                const Text("Vừa khởi tạo...")
              ] else if (cubit.state is CountLoading) ...[
                const Text("Đang loading .....")
              ] else if (cubit.state is CountLoaded) ...[
                Text("count: ${cubit.count}")
              ] else ...[
                const Text("Lỗi")
              ],
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () => cubit.increment(),
                child: const Text('+'),
              ),
            ],
          );
        },
        stream: cubit.stream);
  }
}
