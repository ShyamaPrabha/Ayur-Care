import 'package:ayur_care/core/constants/app_strings.dart';
import 'package:ayur_care/presentation/screens/auth/login_screen.dart';
import 'package:ayur_care/presentation/screens/widgets/app_svg.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 5,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppStrings.splashBg,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          ScaleTransition(
            scale: _animation,
            child: Center(child: AppSvg(assetName: AppStrings.ayurCareLogo)),
          ),
        ],
      ),
    );
  }
}
