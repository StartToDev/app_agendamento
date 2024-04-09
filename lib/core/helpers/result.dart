sealed class Result<R, T> {
  const Result();
}

final class Success<R, T> extends Result<R, T> {
  const Success(this.object) : super();

  final T object;
}

final class Failure<R, T> extends Result<R, T> {
  const Failure(this.error) : super();

  final R error;
}

// consulta dia quarta => 10 e meia
// 17 de abstract class Result {
// Marilia => Postinho 

// }