import 'package:mutual_funds_watchlist/core/error/failures.dart';
import 'package:mutual_funds_watchlist/core/usecase/usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthVerifyOtp implements UseCase<void, AuthVerifyOtpParams> {
  final AuthRepository authRepository;
  AuthVerifyOtp(this.authRepository);

  @override
  Future<Either<Failure, void>> call(AuthVerifyOtpParams params) async {
    return await authRepository.verifyOtp(phone: params.phone, otp: params.otp);
  }
}

// create sign in parameters class
class AuthVerifyOtpParams {
  final String phone;
  final String otp;

  AuthVerifyOtpParams({required this.phone, required this.otp});
}
