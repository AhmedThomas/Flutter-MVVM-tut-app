import 'package:advanced_flutter_mvvm/data/network/failure.dart';
import 'package:advanced_flutter_mvvm/data/network/requestes.dart';
import 'package:advanced_flutter_mvvm/domain/model/models.dart';
import 'package:advanced_flutter_mvvm/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
