import 'package:dartz/dartz.dart';
import 'package:portfolio_app/core/error/failures.dart';
import 'package:portfolio_app/models/contact_model.dart';

import '../datasources/remote/contact_remote_datasource.dart';

abstract class ContactRepository {
  Future<Either<Failure, ContactModel>> getContact();
}

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource _remoteDataSource;

  ContactRepositoryImpl({required ContactRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, ContactModel>> getContact() async {
    try {
      final contact = await _remoteDataSource.getContact();
      return Right(contact);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
