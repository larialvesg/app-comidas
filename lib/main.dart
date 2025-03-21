import 'package:flutter/material.dart';
import 'package:food/donut.dart';
import 'package:food/burguer.dart';
import 'package:food/icecream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Para qual página você quer ir?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                  imagePath: 'assets/images/burguer.png',
                  label: 'Burguer',
                  page: const BurguerPage(),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFECDA6), Color(0xFFF6A06D)],
                  ),
                ),
                const SizedBox(width: 20),
                MenuButton(
                  imagePath: 'assets/images/icecream.png',
                  label: 'Ice Cream',
                  page: const IceCreamPage(),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFC1C1), Color(0xFFFF7F7F)],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            MenuButton(
              imagePath: 'assets/images/donut.png',
              label: 'Donut',
              page: const DonutPage(),
              gradient: const LinearGradient(
                colors: [Color(0xFF4227A8), Color(0xFF00A0EF), Color(0xFF6FF9E7)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final Widget page;
  final LinearGradient gradient;

  const MenuButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.page,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 175,
        height: 170,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 16,
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              bottom: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                },
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
