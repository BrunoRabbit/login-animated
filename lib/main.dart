import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff2a282a),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double? newConstraints = 0.0;
  double index = 0.0;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late Color primaryColor;
  final RegExp _regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final List<Color> _listColors = [
    Colors.blueGrey,
    const Color(0xff00cc00),
    Colors.yellow,
    Colors.red,
  ];

  changeIndex() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        index = 0;
      });
    }

    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        index = 2;
      });
    }

    if (_emailController.text.isNotEmpty && _passwordController.text.isEmpty) {
      setState(() {
        index = 3;
      });
    }
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    primaryColor = Theme.of(context).colorScheme.primary;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2a282a),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.05,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Column(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        newConstraints = constraints.maxWidth / index;
                        return Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 12,
                              decoration: const ShapeDecoration(
                                color: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(14),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedSize(
                              alignment: Alignment.centerLeft,
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              child: Container(
                                width: newConstraints,
                                height: 12,
                                decoration: ShapeDecoration(
                                  color: _listColors[index.toInt()],
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Welcome back!',
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: primaryColor.withOpacity(0.65),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
                      width: 295,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        onChanged: (text) {
                          if (_regExp.hasMatch(text)) {
                            changeIndex();
                          }
                        },
                        controller: _emailController,
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'E-mail',
                          hintStyle: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: primaryColor,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.mail_rounded,
                            size: 25,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 295,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        onChanged: (text) {
                          changeIndex();
                        },
                        controller: _passwordController,
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: primaryColor,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_rounded,
                            size: 25,
                            color: primaryColor,
                          ),
                          suffixIcon: Icon(
                            FeatherIcons.eyeOff,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: Text(
                          'Forget password?',
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 295,
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
