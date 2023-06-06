import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartup/inputRoute.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);


  static const String _title = 'Smart UP';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: VerificationCode(),
    );
  }
}

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final TextEditingController _controller1 = TextEditingController(text: "");

  final TextEditingController _controller2 = TextEditingController(text: "");
  final TextEditingController _controller3 = TextEditingController(text: "");
  final TextEditingController _controller4 = TextEditingController(text: "");
  final TextEditingController _controller5 = TextEditingController(text: "");
  final TextEditingController _controller6 = TextEditingController(text: "");
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  FocusNode focusNode7 = FocusNode();




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
                    const SizedBox(height: 70),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 20),
                        IconButton(
                          icon:
                          const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 800,
                      alignment: Alignment.center,
                      child: Column(children: <Widget>[
                        const SizedBox(height: 120),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 45),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'VERIFICATION',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Color(0xFF374A67),
                                        fontSize: 26,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'CODE',
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
                        const SizedBox(height: 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                                maxLength: 1,
                                controller: _controller1 ,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  border: OutlineInputBorder(),
                                  counterText: '',
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context).requestFocus(focusNode2);
                                  }
                                },
                                // set focus to this text field when it's created
                                focusNode: focusNode1,

                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                                maxLength: 1,
                                controller: _controller2,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  border: OutlineInputBorder(),
                                  counterText: '',
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context).requestFocus(focusNode3);
                                  }
                                },
                                // set focus to this text field when the previous text field has a value
                                focusNode: focusNode2,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                                maxLength: 1,
                                controller: _controller3,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  border: OutlineInputBorder(),
                                  counterText: '',
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context).requestFocus(focusNode4);
                                  }
                                },
                                // set focus to this text field when the previous text field has a value
                                focusNode: focusNode3,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                                maxLength: 1,
                                controller: _controller4,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,

                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  border: OutlineInputBorder(),
                                  counterText: '',
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context).requestFocus(focusNode5);
                                  }
                                },
                                // set focus to this text field when the previous text field has a value
                                focusNode: focusNode4,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                                maxLength: 1,
                                controller: _controller5,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  border: OutlineInputBorder(),
                                  counterText: '',
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context).requestFocus(focusNode6);
                                  }
                                },
                                // set focus to this text field when the previous text field has a value
                                focusNode: focusNode5,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                                maxLength: 1,
                                controller: _controller6,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,

                                  border: OutlineInputBorder(),
                                  counterText: '',
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context).requestFocus(focusNode7);
                                  }
                                },
                                // set focus to this text field when the previous text field has a value
                                focusNode: focusNode6,
                              ),
                            ),
                          ],
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
                            if (_controller1.text.isEmpty ||
                                _controller2.text.isEmpty ||
                                _controller3.text.isEmpty ||
                                _controller4.text.isEmpty ||
                                _controller5.text.isEmpty ||
                                _controller6.text.isEmpty) {
                              setState(() {
                                _showError = true;
                              });


                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InputRoute()),
                            );
                          },
                          child: SizedBox(
                            width: 220,
                            child: Center(
                              child: Text(
                                'CONTINUE',
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
