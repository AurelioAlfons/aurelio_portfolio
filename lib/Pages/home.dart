// Author: Aurelio Hevi Alfons

// ignore_for_file: deprecated_member_use

import 'package:aurelio_portfolio/Pages/home_content.dart';
import 'package:aurelio_portfolio/widget/end_drawer.dart';
import 'package:aurelio_portfolio/widget/top_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  final ValueNotifier<bool> _isNavbarVisible = ValueNotifier(true);
  double _lastScrollOffset = 0;

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final resumeKey = GlobalKey();
  final blogKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      final offset = _scrollController.offset;

      if (offset > _lastScrollOffset && offset > 100) {
        _isNavbarVisible.value = false;
      } else if (offset < _lastScrollOffset) {
        _isNavbarVisible.value = true;
      }

      _lastScrollOffset = offset;
    });
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 54),
      endDrawer: DrawerMenu(
        onItemSelected: scrollTo,
        keys: {
          'Home': homeKey,
          'About': aboutKey,
          'Resume': resumeKey,
          'Blog': blogKey,
          'Contact': contactKey,
        },
      ),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 80),
                HomeContent(homeKey: homeKey),
                Container(
                    key: aboutKey,
                    child: const Placeholder(fallbackHeight: 300)),
                Container(
                    key: resumeKey,
                    child: const Placeholder(fallbackHeight: 300)),
                Container(
                    key: blogKey,
                    child: const Placeholder(fallbackHeight: 300)),
                Container(
                    key: contactKey,
                    child: const Placeholder(fallbackHeight: 300)),
              ],
            ),
          ),

          // Animated Navbar
          ValueListenableBuilder<bool>(
            valueListenable: _isNavbarVisible,
            builder: (context, visible, _) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: visible ? 0 : -100,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TopNavBar(
                    onItemSelected: scrollTo,
                    keys: {
                      'Home': homeKey,
                      'About': aboutKey,
                      'Resume': resumeKey,
                      'Blog': blogKey,
                      'Contact': contactKey,
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isNavbarVisible.dispose();
    super.dispose();
  }
}
