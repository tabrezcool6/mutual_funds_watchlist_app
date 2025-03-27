import 'dart:async';
import 'package:bloc/bloc.dart';

class OtpTimerCubit extends Cubit<int> {
  Timer? _timer;
  static const int initialCountdown = 30; // Initial countdown value

  OtpTimerCubit() : super(initialCountdown); // Start with 30 seconds

  void startCountdown() {
    _timer?.cancel(); // Cancel any existing timer
    emit(initialCountdown); // Reset to initial value
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 1) {
        emit(state - 1);
      } else {
        emit(0); // Countdown completed
        _timer?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
