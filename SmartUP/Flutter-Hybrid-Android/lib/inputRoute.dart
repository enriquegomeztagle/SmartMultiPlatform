import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'route.dart';

class InputRoutePage extends StatelessWidget {
  const InputRoutePage({Key? key}) : super(key: key);

  static const String _title = 'Smart UP';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: InputRoute(),
    );
  }
}

class InputRoute extends StatefulWidget {
  // RECEIVE ORIGIN FROM PREVIOUS PAGE
  const InputRoute({super.key, origin});

  @override
  State<InputRoute> createState() => _InputRouteState();
}

class _InputRouteState extends State<InputRoute> {
  // CREATE VARIABLE TO RECEIVE InputRoute FROM INPUT FIELD
  final TextEditingController _origin = TextEditingController(text: "");
  final TextEditingController _destiny = TextEditingController(text: "");
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    // final org = ModalRoute.of(context)!.settings.arguments as String;
    // final origin = org.toUpperCase();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 750,
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  const SizedBox(height: 70),
                  Row(
                    // ADD A ICON TO GO TO PREVIOUS PAGE
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
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/LOGOcolorSMART.png',
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                      height: 70,
                      width: 330,
                      child: Center(
                          child: PhysicalModel(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        elevation: 1,
                        child: TextField(
                          controller: _origin,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(),
                          decoration: const InputDecoration(
                            hintText: 'WHERE ARE YOU?',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
                  const SizedBox(height: 30),
                  SizedBox(
                      height: 70,
                      width: 330,
                      child: Center(
                          child: PhysicalModel(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        elevation: 1,
                        child: TextField(
                          controller: _destiny,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(),
                          decoration: const InputDecoration(
                            hintText: 'WHERE DO YOU WANT TO GO?',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
                  if (_showError)
                    Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: const Text(
                        'PLEASE FILL ALL FIELDS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xF223295B)
                        ),
                      ),
                    ),
                  const SizedBox(height: 70),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xF223295B),
                      shadowColor: Colors.black,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                    onPressed: () {
                      if (_destiny.text.isEmpty || _origin.text.isEmpty) {
                        setState(() {
                          _showError = true;
                        });
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RouteLogin(),
                          settings: RouteSettings(
                              arguments: Path(
                                  origin: _origin.text,
                                  destiny: _destiny.text)),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          'NEXT',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }

  _InputRouteState();
}
