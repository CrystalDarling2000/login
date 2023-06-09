import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_vanguard/firebase_options.dart';
import 'patients.dart';
import 'profile_screen.dart';
import 'register.dart';
import 'auth.dart';
import 'image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Patients();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Login Function

  @override
  Widget build(BuildContext context) {
    bool _loading = false;

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    handleSubmit() async {
      final email = _emailController.value.text;
      final password = _passwordController.value.text;

      setState(() => _loading = true);

      //Check if is login or register

      await Auth().signInWithEmailAndPassword(email, password);

      setState(() => _loading = false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Patients()));
    }

    handleRegister() async {
      final email = _emailController.value.text;
      final password = _passwordController.value.text;

      setState(() => _loading = true);

      //Check if is login or register

      await Auth().register(email, password);

      setState(() => _loading = false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Patients()));
    }

    onRegister() {
      print('pushed');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
    }
    //create the textfield controller

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Vanguard',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 44.0,
              ),
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 44.0,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "User Email",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 26.0,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "User Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                "Don't Remember your password?",
                style: TextStyle(color: Colors.blue),
              ),
              const SizedBox(
                height: 88.0,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: RawMaterialButton(
                      fillColor: const Color(0xFF0069FE),
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () {
                        handleSubmit();
                      },
                      child: _loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text('Login'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    child: Text(
                      "New to this?",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () => onRegister(),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   child: RawMaterialButton(
                  //     fillColor: const Color(0xFF0069FE),
                  //     elevation: 0.0,
                  //     padding: const EdgeInsets.symmetric(vertical: 20.0),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12.0)),
                  //     onPressed: () {
                  //       handleRegister();
                  //     },
                  //     child: _loading
                  //         ? const SizedBox(
                  //             width: 20,
                  //             height: 20,
                  //             child: CircularProgressIndicator(
                  //               color: Colors.white,
                  //               strokeWidth: 2,
                  //             ),
                  //           )
                  //         : Text('Register'),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
