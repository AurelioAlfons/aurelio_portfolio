import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  final Function(GlobalKey) onItemSelected;
  final Map<String, GlobalKey> keys;

  const TopNavBar({
    super.key,
    required this.onItemSelected,
    required this.keys,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/nav_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo + Name
          Row(
            children: [
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => onItemSelected(keys['Home']!),
                child: const Text(
                  "Aurelio Hevi Alfons ⚡",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // Nav or Drawer
          isSmallScreen
              ? Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                )
              : Row(
                  children: [
                    _navItem("Home", () => onItemSelected(keys["Home"]!)),
                    _navItem("About", () => onItemSelected(keys["About"]!)),
                    _navItem("Resume", () => onItemSelected(keys["Resume"]!)),
                    _navItem("Blog", () => onItemSelected(keys["Blog"]!)),
                    _navItem("Contact", () => onItemSelected(keys["Contact"]!)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                decorationColor: Colors.transparent, // We'll animate this next
                decorationThickness: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
