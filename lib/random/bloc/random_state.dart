part of 'random_bloc.dart';

@immutable
abstract class RandomState {
  const RandomState();
}

class RandomInitial extends RandomState {}

class RandomLoading extends RandomState {
  const RandomLoading();
}

class RandomLoaded extends RandomState {
  final String random;
  const RandomLoaded(this.random);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RandomLoaded && o.random == random;
  }

  @override
  int get hashCode => random.hashCode;
}

class RandomError extends RandomState {
  final String message;
  const RandomError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RandomError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
