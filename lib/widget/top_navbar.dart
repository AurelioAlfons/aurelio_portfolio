import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

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
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/linkedin.svg',
                  width: 40,
                  height: 40,
                  color: const Color.fromARGB(255, 255, 28, 62),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 12),
              const Text(
                "Aurelio Hevi Alfons ⚡",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                    _navItem("Home"),
                    _navItem("About"),
                    _navItem("Resume"),
                    _navItem("Blog"),
                    _navItem("Contact"),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
