part of 'count_cubit.dart';

@immutable
abstract class CountState {
  const CountState();
}

class CountInitial extends CountState {
  const CountInitial();
}
class CountLoading extends CountState {
  const CountLoading();
}

class CountLoaded extends CountState {
  final int count;
  const CountLoaded(this.count);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CountLoaded && o.count == count;
  }

  @override
  int get hashCode => count.hashCode;
}

class CountError extends CountState {
  final String message;
  const CountError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CountError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
