import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

class Path {
  final String origin;
  final String destiny;

  Path({required this.origin, required this.destiny});
}

class Route extends StatelessWidget {
  const Route({Key? key}) : super(key: key);

  static const String _title = 'Smart UP';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: RouteLogin(),
    );
  }
}

class RouteLogin extends StatefulWidget {
  const RouteLogin({super.key});

  @override
  State<RouteLogin> createState() => _RouteLoginState();
}

class _RouteLoginState extends State<RouteLogin> {
  @override
  Widget build(BuildContext context) {
    // GET FIRST ARGUMENT RECEIVED FROM PREVIOUS PAGE
    final way = ModalRoute.of(context)!.settings.arguments as Path;
    final org = way.origin;
    final des = way.destiny;

    final origin = org.toUpperCase();
    final destiny = des.toUpperCase();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/LOGOcolorSMART.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 700,
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  const SizedBox(height: 70),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        // GO TO PREVIOUS PAGE
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 45),
                        Column(
                          children: <Widget>[
                            Text(
                              'ROUTE',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color(0xFF374A67),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'FROM:\t $origin',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'TO:\t $destiny',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      backgroundColor: const Color(0xFF374A67),
                      side: const BorderSide(
                        width: 0.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: SizedBox(
                      width: 175,
                      child: Center(
                        child: Text(
                          'CONTINUE',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
