import 'package:mutual_funds_watchlist/core/error/failures.dart';
import 'package:mutual_funds_watchlist/core/usecase/usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSession implements UseCase<Session, NoParams> {
  AuthRepository authRepository;
  AuthSession(this.authRepository);

  @override
  Future<Either<Failure, Session>> call(NoParams params) async {
    return await authRepository.getAuthSession();
  }
}

// This "NoParams" should me declared here as per the flow, 
// but multiples classes or functions make use of this "NoParams" class, 
// hence declared in the Universal "UseCase" class
// This is class => " class NoParams {} "
