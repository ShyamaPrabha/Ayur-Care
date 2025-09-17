import 'package:ayur_care/core/config/api_constants.dart';
import 'package:ayur_care/data/datasources/remote/auth_api.dart';
import 'package:ayur_care/data/datasources/remote/patient_api.dart';
import 'package:ayur_care/data/repositories/auth_repository_impl.dart';
import 'package:ayur_care/data/repositories/patient_repository_impl.dart';
import 'package:ayur_care/domain/repositories/patient_repository.dart';
import 'package:ayur_care/domain/usecases/auth_use_case.dart';
import 'package:ayur_care/domain/usecases/patient_use_case.dart';
import 'package:ayur_care/main.dart';
import 'package:ayur_care/presentation/provider/auth/auth_provider.dart';
import 'package:ayur_care/presentation/provider/dashboard/dashboard_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../domain/repositories/auth_repository.dart';

MultiProvider appProviders() {
  final http.Client client = http.Client();
  return MultiProvider(
    providers: [
      Provider<AuthApi>(
        create: (_) => AuthApi(baseUrl: baseUrl, client: client),
      ),
      Provider<AuthRepository>(
        create: (context) => AuthRepositoryImpl(
          authApi: Provider.of<AuthApi>(context, listen: false),
        ),
      ),
      Provider<AuthUseCase>(
        create: (context) => AuthUseCase(
          repository: Provider.of<AuthRepository>(context, listen: false),
        ),
      ),
      ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(
          authUseCase: Provider.of<AuthUseCase>(context, listen: false),
        ),
      ),
       Provider<PatientApi>(
        create: (_) => PatientApi(baseUrl: baseUrl, client: client),
      ),
      Provider<PatientRepository>(
        create: (context) => PatientRepositoryImpl(
          patientApi:  Provider.of<PatientApi>(context, listen: false),
        ),
      ),
      Provider<PatientUseCase>(
        create: (context) => PatientUseCase(
          repository: Provider.of<PatientRepository>(context, listen: false),
        ),
      ),
      ChangeNotifierProvider<DashboardProvider>(
        create: (context) => DashboardProvider(
          useCase: Provider.of<PatientUseCase>(context, listen: false),
        ),
      ),
    ],
    child: const MyApp(),
  );
}
