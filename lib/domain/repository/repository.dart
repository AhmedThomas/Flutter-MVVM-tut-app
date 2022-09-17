import 'package:advanced_flutter_mvvm/data/network/requestes.dart';
import 'package:advanced_flutter_mvvm/domain/model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
