import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokdex/core/errror/app_error.dart';


//parameter
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}


//no parameter
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
