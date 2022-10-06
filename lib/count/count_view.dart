import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/count_cubit.dart';

class CountView extends StatefulWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  State<CountView> createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountCubit, CountState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is CountInitial) ...[
              const Text("Vừa khởi tạo...")
            ] else if (state is CountLoading) ...[
              const Text("Đang loading .....")
            ] else if (state is CountLoaded) ...[
              Text("count: ${state.count}")
            ] else ...[
              const Text("Lỗi")
            ],
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () => context.read<CountCubit>().increment(),
              child: const Text('+'),
            ),
          ],
        );
      },
    );
  }
}
