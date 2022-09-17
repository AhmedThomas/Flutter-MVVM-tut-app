import 'package:advanced_flutter_mvvm/data/data_sources/remote/remote_data.dart';
import 'package:advanced_flutter_mvvm/data/mapper/mapper.dart';
import 'package:advanced_flutter_mvvm/data/network/error_handler.dart';
import 'package:advanced_flutter_mvvm/data/network/network_info.dart';
import 'package:advanced_flutter_mvvm/domain/model/models.dart';
import 'package:advanced_flutter_mvvm/data/network/requestes.dart';
import 'package:advanced_flutter_mvvm/data/network/failure.dart';
import 'package:advanced_flutter_mvvm/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // is connected to internet , it's safe to call API

      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data
          return Right(response.toDomain());
        } else {
          // failure -- return business error
          // return either left
          return Left(
            Failure(ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DEFAULT),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
