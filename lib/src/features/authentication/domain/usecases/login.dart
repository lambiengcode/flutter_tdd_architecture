import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_architecture/src/core/error/failures.dart';
import 'package:flutter_tdd_architecture/src/core/usecases/usecase.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/repositories/authentication_repository.dart';

class Login implements UseCase<User, Params> {
  final AuthenticationRepository repository;

  Login({required this.repository});

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.login(username: params.username, password: params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
