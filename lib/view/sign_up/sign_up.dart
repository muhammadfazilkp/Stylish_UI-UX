import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/controller/feach_data/user_provider.dart';
import 'package:stylish/model/registeration_model.dart';
import 'package:stylish/view/dashbord/dashbord.dart';

import '../../core/textfield_widget.dart';

final key = GlobalKey<FormState>();

class ScreenSignup extends StatelessWidget {
  const ScreenSignup({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ils_11.png"),
                fit: BoxFit.contain)),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: key,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(60, 60))),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<UserProvider>(
                    builder: (context, value, child) => Column(
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Sign Up to continue",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Mytextfield(
                          labeltext: "Username",
                          controller: value.userNameContoroller,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Mytextfield(
                          labeltext: 'Lastname',
                          controller: value.lastnameController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Mytextfield(
                          labeltext: "Phone number",
                          controller: value.phoneController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Mytextfield(
                          labeltext: "Email",
                          controller: value.emailsController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Mytextfield(
                          labeltext: "Password",
                          icon: Icons.visibility,
                          controller: value.passwordController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Mytextfield(
                          labeltext: 'Enter pincode',
                          controller: value.pincodeController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Mytextfield(
                          labeltext: 'Enter the city',
                          controller: value.cityController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            height: 50,
                            width: 320,
                            child: ElevatedButton(
                              onPressed: () async{
                                final SharedPreferences preferences = await SharedPreferences.getInstance();
                              final registerStatus=  preferences.getBool('registerStatus');
                                if (key.currentState!.validate()) {
                                 await value.registerUser(
                                      userFirstname:
                                          value.userNameContoroller.text,
                                      userLastname:
                                          value.lastnameController.text,
                                      userEmail: value.emailsController.text,
                                      userPhone: value.phoneController.text,
                                      userPassword: value.password.text,
                                      userCity: value.cityController.text,
                                      userZipcode:
                                          value.pincodeController.text);
                                          if(registerStatus==true){
                                               ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.green,
                                            content: Text(
                                                'Registration Success')),
                                      );
                                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashbordScreen(),), (route) => false);
                                          }else{
                                               ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.red,
                                            content: Text(
                                                'User Already Exist')),
                                      );
                                          }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  backgroundColor: Colors.deepPurple),
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "I'm already a user.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                                onPressed: () {
                                  // Navigator.pushAndRemoveUntil(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           // conScreenSignup(),
                                  //     ),
                                  //     (route) => false);
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.deepPurple, fontSize: 16),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
