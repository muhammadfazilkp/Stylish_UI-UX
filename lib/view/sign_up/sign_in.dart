import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/controller/feach_data/user_provider.dart';
import 'package:stylish/view/dashbord/dashbord.dart';
import 'package:stylish/view/landing_page/landing_page.dart';
import 'package:stylish/view/sign_up/sign_up.dart';

import '../../core/textfield_widget.dart';

final formkey = GlobalKey<FormState>();

class ScreenSignin extends StatelessWidget {
  const ScreenSignin({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Consumer<UserProvider>(
            builder: (context, value, child) => SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Image(image: AssetImage('asset/splash2.jpg')),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Mytextfield(
                              labeltext: "Email or username",
                              controller: value.emailController,
                            ),
                            const SizedBox(height: 30),
                            Mytextfield(
                              labeltext: "Password",
                              icon: Icons.visibility,
                              controller: value.passwordController,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              width: 350,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final SharedPreferences preferences =
                                      await SharedPreferences.getInstance();
                                  final loginStatus =
                                      preferences.getBool('LoginStatus');

                                  if (formkey.currentState!.validate()) {
                                    await value.loginUser(
                                        value.emailController.text.toString(),
                                        value.passwordController.text
                                            .toString());

                                    if (loginStatus == true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DashbordScreen( ),
                                          ));
                                           ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.green,
                                            content: Text(
                                                'Login Success')),
                                      );

                                      print('Login successful');
                                    } else {
                                      // Login failed, show an error message to the user
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Login failed. Please check your credentials.')),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  backgroundColor:
                                      const Color.fromARGB(255, 162, 60, 187),
                                ),
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "I'm a new user.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ScreenSignup(),
                                        ));
                                  },
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.deepPurple, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
