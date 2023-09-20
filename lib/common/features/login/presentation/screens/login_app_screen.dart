import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/common/features/login/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';

class LoginAppScreen extends StatelessWidget {
  const LoginAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginView()),
    );
  }
}
