import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/build_welcom.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../bloc/login_bloc.dart';
import '../screens/loged_screen.dart';
import '../widgets/login_form/initial_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: _listener,
      builder: (context, loginState) {
        if (loginState is LoginInitial) {
          return _Login(
            colors: colors,
          );
        }
        if (loginState is LoginLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (loginState is LoginErrorState) {
          return _Login(
            errorStatus: true,
            colors: colors,
          );
        }
        return const LogedAppScreen();
      },
    );
  }

  _listener(BuildContext context, LoginState loginState) {
    if (loginState is LoginDoneState) return context.go("/");
  }
}

class _Login extends StatelessWidget {
  final bool errorStatus;
  final ColorScheme colors;
  const _Login({this.errorStatus = false, required this.colors});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BuildWelcomeWidget(),
          FormLogin(context: context),
          _buildWarning(error: errorStatus),
          CustomButton(
            text: "Acceder",
            background: colors.primary,
            padding: const EdgeInsets.all(20),
            onPressed: () =>
                context.read<LoginBloc>().add(SendDataToVerifyLogin()),
          ),
          _buildSignUp(context, colors),
        ],
      ),
    );
  }

  _buildSignUp(BuildContext context, ColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        background: colors.primary,
        text: "Registrarse",
        onPressed: () => context.go("/singUp"),
      ),
    );
  }

  _buildWarning({required bool error}) {
    if (error) {
      return const Text(
        "Incorrect credentials...",
        style: TextStyle(color: Colors.red),
      );
    }
    return const Text("");
  }
}
