import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordreController = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showMyDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showMyDialog('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: const Text('Warnning'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel',),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Welcome to our community",
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                "\nTo get started, please provide your information to create an account\n",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: nameController,
                  hintText: "Enter your name.",
                  obscureText: false,
                  labelText: 'Name'),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "Enter your email.",
                  obscureText: false,
                  labelText: 'Email'),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  controller: passwordController,
                  hintText: "Enter your password.",
                  obscureText: true,
                  labelText: 'Password'),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  controller: passwordreController,
                  hintText: "Enter your password again.",
                  obscureText: true,
                  labelText: 'Re-password'),
              const SizedBox(
                height: 20,
              ),
              MyButton(onTap: createUserWithEmailAndPassword, hinText: "sign up"),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have a member?",
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen())); //การเชื่อมหน้าต่างแอป
                    },
                    child: Text(
                      "Sign in.",
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
