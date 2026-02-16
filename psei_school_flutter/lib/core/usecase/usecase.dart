import 'package:fpdart/fpdart.dart';
import 'package:psei_school_flutter/core/error/failures.dart';

abstract class Usecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}