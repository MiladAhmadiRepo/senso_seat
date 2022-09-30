import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:senso_seat/custom_outline.dart';
import 'package:senso_seat/core/constants.dart';

import '../core/color.dart';
import '../core/screen_utility.dart';
import '../core/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final _formKey;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtility().init(context);
    return Scaffold(
      backgroundColor: kBlackColor,
      extendBody: true,
      body: Form(
        key: _formKey,

        child: SizedBox(
          width: ScreenUtility.screenWidth,
          height: ScreenUtility.screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: ScreenUtility.screenHeight * 0.1,
                left: -88,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:  kPinkColor,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: ScreenUtility.screenHeight * 0.3,
                right: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:  kGreenColor,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: ScreenUtility.screenHeight * 0.01,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius:ScreenUtility. screenWidth * 0.8,
                      padding: const EdgeInsets.all(4),
                      width: ScreenUtility.screenWidth * 0.8,
                      height: ScreenUtility.screenWidth * 0.8,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            kPinkColor,
                            kPinkColor.withOpacity(0),
                            kGreenColor.withOpacity(0.1),
                            kGreenColor
                          ],
                          stops: const [
                            0.2,
                            0.4,
                            0.6,
                            1
                          ]),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: AssetImage('assets/images/login.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtility.screenHeight * 0.02,
                    ),
                    Text(
                      techNoteString,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kWhiteColor.withOpacity(0.85),
                        fontSize: ScreenUtility.screenHeight <= 667 ? 15 : 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtility.screenHeight * 0.05,
                    ),
                    Text(
                      signIntoString,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kWhiteColor.withOpacity(0.75),
                        fontSize: ScreenUtility.screenHeight <= 667 ? 12 : 16,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtility.screenHeight * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        style: TextStyle(color: textColor),
                        validator: (value) {
                          return Utility().fieldValidation(value, false);
                        },
                        controller: usernameController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: activeColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: mainStatusBarColor,
                                width: 2.0,
                              ),
                            ),
                            hintText: usernameString,
                            suffixIcon: const Icon(
                              Icons.email,
                              color: activeColor,
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        style: TextStyle(color: textColor),

                        obscureText: true,
                        validator: (value) {
                          return Utility().fieldValidation(value, true);
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: activeColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: mainStatusBarColor,
                                width: 2.0,
                              ),
                            ),
                            hintText: passwordString,
                            suffixIcon: const Icon(
                              Icons.lock,
                              color: activeColor,
                            )),
                      ),
                    ),
                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomOutline(
                          strokeWidth: 3,
                          radius: 20,
                          padding: const EdgeInsets.all(3),
                          width: 160,
                          height: 38,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [kPinkColor, kGreenColor],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  kPinkColor.withOpacity(0.5),
                                  kGreenColor.withOpacity(0.5)
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                loginString,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        CustomOutline(
                          strokeWidth: 3,
                          radius: 20,
                          padding: const EdgeInsets.all(3),
                          width: 160,
                          height: 38,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [kPinkColor, kGreenColor],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  kPinkColor.withOpacity(0.5),
                                  kGreenColor.withOpacity(0.5)
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                singUpString,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
