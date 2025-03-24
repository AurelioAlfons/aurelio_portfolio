// Author: Aurelio Hevi Alfons

// ignore_for_file: deprecated_member_use

import 'package:aurelio_portfolio/widget/end_drawer.dart';
import 'package:aurelio_portfolio/widget/top_navbar.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 54),
      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopNavBar(),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    height * 0.32,
                    20,
                    60,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Aurelio Hevi Alfons's Socials",
                        style: TextStyle(
                          fontSize: width < 600 ? 28 : 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 85, 73, 255),
                            ),
                            onPressed: () => _launchURL(
                                "https://www.facebook.com/aurelio.hevialfons"),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/instagram.svg',
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 255, 63, 105),
                            ),
                            onPressed: () => _launchURL(
                                "https://www.instagram.com/aurelio_alfons/"),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/github.svg',
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 255, 200, 83),
                            ),
                            onPressed: () =>
                                _launchURL("https://github.com/AurelioAlfons"),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/linkedin.svg',
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 42, 245, 143),
                            ),
                            onPressed: () => _launchURL(
                                "https://www.linkedin.com/in/aurelio-alfons/"),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/pinterest.svg',
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 255, 28, 62),
                            ),
                            onPressed: () => _launchURL(""),
                          ),
                        ],
                      ),

                      const SizedBox(height: 50),

                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (_) => setState(() => isHovered = true),
                        onExit: (_) => setState(() => isHovered = false),
                        child: GestureDetector(
                          onTap: () {
                            // Add navigation or action here if needed
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color:
                                  isHovered ? Colors.white : Colors.transparent,
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
                              horizontal: 50,
                              vertical: 15,
                            ),
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
            ),
          ],
        ),
      ),

      // End Drawer
      endDrawer: const DrawerMenu(),
    );
  }
}
