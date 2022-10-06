import 'package:flutter/material.dart';

import 'bloc/random_bloc.dart';

class RandomView extends StatefulWidget {
  const RandomView({Key? key}) : super(key: key);

  @override
  State<RandomView> createState() => _RandomViewState();
}

class _RandomViewState extends State<RandomView> {
  final _bloc = RandomBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          return Column(
            children: [
              if (_bloc.state is RandomInitial) ...[
                const Text("Vừa khởi tạo...")
              ] else if (_bloc.state is RandomLoading) ...[
                const Text("Đang loading .....")
              ] else if (_bloc.state is RandomLoaded) ...[
                Text("Random: ${(_bloc.state as RandomLoaded).random}")
              ] else ...[
                const Text("Lỗi")
              ],
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () => _bloc.add(GetRandom()),
                child: const Text('+'),
              ),
            ],
          );
        });
  }
}
