import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final Widget childrenView;
  const HomeScreen({super.key, required this.childrenView});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: _DrawerConfig().draweConfig(context),
      appBar: _AppBar().appBarConfig(colors),
      body: Container(
        child: childrenView,
      ),
    );
  }
}

class _AppBar {
  AppBar appBarConfig(ColorScheme colors) {
    return AppBar(
      title: const Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: colors.primary,
    );
  }
}

class _DrawerConfig {
  Drawer draweConfig(BuildContext context) {
    return Drawer(
        child: SafeArea(
            child: Container(
      color: Colors.white,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cnnespanol.cnn.com/wp-content/uploads/2015/09/monkey-selfie.jpeg?quality=100&strip=info&w=460&h=260&crop=1")),
              accountName: Text("Aramis Jaime"),
              accountEmail: Text("aramisjaime48@gmail.com")),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home_filled),
            onTap: () {
              context.go("/");
              Navigator.pop(context);
            },
          ),
          const ListTile(
            title: Text("User"),
            leading: Icon(Icons.account_circle),
          ),
          const ListTile(
            title: Text("Create new publication"),
            leading: Icon(Icons.create_rounded),
          ),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            onTap: () {
              context.go("/settings");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("login"),
            leading: const Icon(Icons.login),
            onTap: () {
              context.go("/login");
              Navigator.pop(context);
            },
          )
        ],
      ),
    )));
  }
}
