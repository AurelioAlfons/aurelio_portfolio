import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 18, 18, 40),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Menu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _drawerItem(context, "Home"),
              _drawerItem(context, "About"),
              _drawerItem(context, "Resume"),
              _drawerItem(context, "Blog"),
              _drawerItem(context, "Contact"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context);
        // Add your route logic here
      },
    );
  }
}
