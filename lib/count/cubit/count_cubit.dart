import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(const CountInitial());
  int _count = 0;
  int get count => _count;

  Future<void> increment() async {
    emit(const CountLoading());
    await Future.delayed(const Duration(milliseconds: 500), () {
      _count++;
      emit(CountLoaded(_count));
    });
  }
}
