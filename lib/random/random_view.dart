import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/random_bloc.dart';

class RandomView extends StatefulWidget {
  const RandomView({Key? key}) : super(key: key);

  @override
  State<RandomView> createState() => _RandomViewState();
}

class _RandomViewState extends State<RandomView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomBloc, RandomState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is RandomInitial) ...[
              const Text("Vừa khởi tạo...")
            ] else if (state is RandomLoading) ...[
              const Text("Đang loading .....")
            ] else if (state is RandomLoaded) ...[
              Text("Random: ${state.random}")
            ] else ...[
              const Text("Lỗi")
            ],
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () => context.read<RandomBloc>().add(GetRandom()),
              child: const Text('+'),
            ),
          ],
        );
      },
    );
  }
}
