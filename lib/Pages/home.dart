// Author: Aurelio Hevi Alfons

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHovered = false;

  // Open a link
  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 54),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Aurelio Hevi Alfons's Personal Page",
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "Australia +61 478 277 275  yuroalfons0407@gmail.com",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // Social Media Links
              Wrap(
                spacing: 15,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/facebook.svg',
                      width: 50,
                      height: 50,
                      color: const Color.fromARGB(255, 85, 73, 255),
                    ),
                    onPressed: () => _launchURL(
                        "https://www.facebook.com/aurelio.hevialfons"),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/instagram.svg',
                      width: 50,
                      height: 50,
                      color: const Color.fromARGB(255, 255, 63, 105),
                    ),
                    onPressed: () =>
                        _launchURL("https://www.instagram.com/aurelio_alfons/"),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/github.svg',
                      width: 50,
                      height: 50,
                      color: const Color.fromARGB(255, 255, 200, 83),
                    ),
                    onPressed: () =>
                        _launchURL("https://github.com/AurelioAlfons"),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/linkedin.svg',
                      width: 50,
                      height: 50,
                      color: const Color.fromARGB(255, 42, 245, 143),
                    ),
                    onPressed: () => _launchURL(
                        "https://www.linkedin.com/in/aurelio-alfons/"),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/pinterest.svg',
                      width: 50,
                      height: 50,
                      color: const Color.fromARGB(255, 255, 28, 62),
                    ),
                    onPressed: () =>
                        _launchURL("https://id.pinterest.com/ahevialfons/"),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              MouseRegion(
                onEnter: (_) => setState(() => isHovered = true),
                onExit: (_) => setState(() => isHovered = false),
                child: GestureDetector(
                  onTap: () {
                    // Add navigation or action here if needed
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: isHovered ? Colors.white : Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: isHovered
                          ? [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.8),
                                blurRadius: 30,
                                spreadRadius: 2,
                              )
                            ]
                          : [],
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        color: isHovered ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
