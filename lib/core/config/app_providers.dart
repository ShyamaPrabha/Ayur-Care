import 'package:ayur_care/main.dart';
import 'package:ayur_care/presentation/provider/auth/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

MultiProvider appProviders() {
  final http.Client client = http.Client();
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ],
    child: const MyApp(),
  );
}
