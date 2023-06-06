import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'quick.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String _title = 'Smart UP';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/LOGOcolorSMART.png',
              width: 200,
              height: 200,
            ),
            Text(
              'Smart UP',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xF223295B),
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Quick()),
                );
              },
              child: SizedBox(
                width: 80,
                child: Center(
                  child: Text(
                    'CONTINUE',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _HomeState();
}
