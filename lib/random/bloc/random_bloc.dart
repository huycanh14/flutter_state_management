import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomBloc() : super(RandomInitial()) {
    on<RandomEvent>((event, emit) async {
      if (event is GetRandom) {
        emit(const RandomLoading());
        await Future.delayed(const Duration(milliseconds: 500), () {
          emit(RandomLoaded(generateRandomString(10)));
        });
      }
    });
  }
}

String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
