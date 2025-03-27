import 'package:mutual_funds_watchlist/core/error/failures.dart';
import 'package:mutual_funds_watchlist/core/usecase/usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthSignIn implements UseCase<void, AuthSignInParams> {
  final AuthRepository authRepository;
  AuthSignIn(this.authRepository);

  @override
  Future<Either<Failure, void>> call(AuthSignInParams params) async {
    return await authRepository.signIn(phone: params.phone);
  }
}

// create sign in parameters class
class AuthSignInParams {
  final String phone;

  AuthSignInParams({required this.phone});
}
