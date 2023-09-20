import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/loged_view.dart';

class LogedAppScreen extends StatelessWidget {
  const LogedAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const SafeArea(
          child: Center(
        child: LogedView(),
      )),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        InkWell(
          onTap: () {
            context.go("/");
          },
          child: const Row(
            children: [Text("Go Home"), Icon(Icons.arrow_forward_ios_outlined)],
          ),
        )
      ],
    );
  }
}
