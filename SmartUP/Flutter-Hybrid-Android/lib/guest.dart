import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartup/inputRoute.dart';

class Guest extends StatelessWidget {
  const Guest({Key? key}) : super(key: key);

  static const String _title = 'Smart UP';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: GuestLogin(),
    );
  }
}

class GuestLogin extends StatefulWidget {
  const GuestLogin({Key? key}) : super(key: key);

  @override
  State<GuestLogin> createState() => _GuestLoginState();
}

class _GuestLoginState extends State<GuestLogin> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  bool _isMissingInfo = false;
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
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
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 70),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 20),
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.black),
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
                                  'GUEST',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF374A67),
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Text(
                                  'ACCOUNT',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        width: 250,
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText:
                                _nameController.text.isEmpty ? "NAME" : "",
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            _scrollToTop(); // Llama la función de desplazamiento aquí
                            setState(() {
                              _nameController.text = '';
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 70,
                        width: 250,
                        child: TextField(
                          controller: _mailController,
                          decoration: const InputDecoration(
                            labelText: "MAIL",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            _scrollToTop(); // Llama la función de desplazamiento aquí
                            setState(() {
                              _mailController.text = '';
                            });
                          },
                          // Establece el comportamiento de la etiqueta como "always floating"
                        ),
                      ),
                      const SizedBox(height: 1),
                      if (_isMissingInfo)
                        const Text(
                          "COMPLETE FIELDS FIRST",
                          style: TextStyle(
                            color: Color(0xFF374A67),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const SizedBox(height: 50),
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
                            horizontal: 50,
                            vertical: 15,
                          ),
                        ),
                        onPressed: () {
                          if (_nameController.text.isEmpty ||
                              _mailController.text.isEmpty) {
                            setState(() {
                              _isMissingInfo = true;
                            });
                          } else {
                            setState(() {
                              _isMissingInfo = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InputRoute(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'CONTINUE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
