// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:stylish/view/sign_up/sign_in.dart';
import 'package:stylish/view/sign_up/sign_up.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 50),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height * 0.55,
                    width: 350,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(36, 66, 177, 173),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "My cantor.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                         Image(image: AssetImage('asset/splash3.jpg'),fit: BoxFit.cover,)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Best way to invest your money",
                style: TextStyle(
                    color: Color.fromARGB(255, 22, 3, 55),
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ScreenSignup()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        backgroundColor:
                            const Color.fromARGB(255, 162, 60, 187)),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const ScreenSignin()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.deepPurple)),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
