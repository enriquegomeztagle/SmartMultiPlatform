import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartup/verification.dart';
import 'package:flutter/services.dart';
class Quick extends StatelessWidget {
  const Quick({Key? key}) : super(key: key);

  static const String _title = 'Smart UP';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: QuickLogin(),
    );
  }
}

class QuickLogin extends StatefulWidget {
  const QuickLogin({super.key});

  @override
  State<QuickLogin> createState() => _QuickLoginState();
}

class _QuickLoginState extends State<QuickLogin> {
  final TextEditingController _controller = TextEditingController(text: "");
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/LOGOcolorSMART.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 800,
                      alignment: Alignment.center,
                      child: Column(children: <Widget>[
                        const SizedBox(height: 250),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 45),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'QUICK',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color(0xFF374A67),
                                        fontSize: 26,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'LOG IN',
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
                        SizedBox(
                          height: 70,
                          width: 330,
                          child: Center(
                            child: PhysicalModel(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              elevation: 1,
                              child: TextField(
                                controller: _controller,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'UP ID',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_showError)
                          Container(
                            padding: const EdgeInsets.only(top: 50),
                            child: const Text(
                              'PLEASE FILL ALL FIELDS',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xF223295B)),
                            ),
                          ),
                        const SizedBox(height: 90),
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
                            if (_controller.text.isEmpty || !_controller.text.contains('@')) {
                              setState(() {
                                _showError = true;


                              });
                              return;
                            }



                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Verification()),
                            );
                          },
                          child: SizedBox(
                            width: 220,
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
              )),
        ));
  }
}
