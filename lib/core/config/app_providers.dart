import 'package:ayur_care/core/config/api_constants.dart';
import 'package:ayur_care/data/datasources/remote/auth_api.dart';
import 'package:ayur_care/data/repositories/auth_repository_impl.dart';
import 'package:ayur_care/domain/usecases/auth_use_case.dart';
import 'package:ayur_care/main.dart';
import 'package:ayur_care/presentation/provider/auth/auth_provider.dart';
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
    ],
    child: const MyApp(),
  );
}
