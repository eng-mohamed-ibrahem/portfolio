import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/view/widgtes/personal_info.dart';
import 'package:portfolio/view/widgtes/works_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: AnimateIfVisibleWrapper(
        // Show each item through
        showItemInterval: const Duration(milliseconds: 300),
        child: ListView(
          children: const [
            PersonalInfo(),
            SizedBox(height: 20),
            WorksSection(),
          ],
        ),
      ),
    );
  }
}
