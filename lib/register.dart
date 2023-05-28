import 'package:flutter/material.dart';
import 'package:login_vanguard/main.dart';
import 'patients.dart';
import 'profile_screen.dart';
import 'register.dart';
import 'auth.dart';
import 'image.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    bool _loading = false;

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    handleRegister() async {
      final email = _emailController.value.text;
      final password = _passwordController.value.text;

      setState(() => _loading = true);

      //Check if is login or register

      await Auth().register(email, password);

      setState(() => _loading = false);
    }

    // onSignup() {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
    // }
    //create the textfield controller

    return Scaffold(
      body: Padding(
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
              'Register',
              style: TextStyle(
                  color: Color(0xFF0069FE),
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
                hintText: "Your Email",
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
                hintText: "Your Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
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
                      handleRegister();
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
                        : Text('Register'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  child: Text(
                    "I'm an OG?",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()))
                  },
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
    );
  }
}
