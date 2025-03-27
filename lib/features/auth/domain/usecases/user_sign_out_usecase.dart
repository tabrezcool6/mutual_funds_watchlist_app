import 'package:mutual_funds_watchlist/core/error/failures.dart';
import 'package:mutual_funds_watchlist/core/usecase/usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthSignOut implements UseCase<String, NoParams> {
  AuthRepository authRepository;
  AuthSignOut(this.authRepository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await authRepository.signOut();
  }
}
