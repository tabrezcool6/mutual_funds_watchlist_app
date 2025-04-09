import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_funds_watchlist/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/pages/welcome_page.dart';
import 'package:mutual_funds_watchlist/features/dashboard/dashboard.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/bloc/otp_timer_cubit/otp_timer_cubit.dart';
import 'package:mutual_funds_watchlist/features/dashboard/nav_pages/charts_page.dart';
import 'package:mutual_funds_watchlist/init_dependencies.dart';

void main() async {
  // deafult method to call bindings and future methods
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependencies
  await initDependencies();

  runApp(
    /// initailizing blocs and cubits used
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<OtpTimerCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mutual Funds Watchlist and Performance Analytics Flutter App',
      theme: ThemeData.dark(),
      home:
      // checking for user sesssion for navigation
      BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            // return const ChartsPage();
            return const Dashboard();
          }
          return const WelcomePage();
        },
      ),
    );
  }
}
