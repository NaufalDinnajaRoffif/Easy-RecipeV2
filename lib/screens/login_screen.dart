import 'package:easy_v3/provider/internet_provider.dart';
import 'package:easy_v3/provider/sign_in_provider.dart';
import 'package:easy_v3/screens/home_screen.dart';
import 'package:easy_v3/screens/phoneauth_screen.dart';
import 'package:easy_v3/utils/config.dart';
import 'package:easy_v3/utils/next_screen.dart';
import 'package:easy_v3/utils/snack_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:provider/provider.dart';
import 'package:easy_v3/utils/color.dart';
import 'package:easy_v3/BottomNavigationBar.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController twitterController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController phoneController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Config.bglogin), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Welcome to ",
                    style: GoogleFonts.poppins(
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Easy Recipe",
                    style: GoogleFonts.poppins(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  //google

                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: RoundedLoadingButton(
                      onPressed: () {
                        handleGoogleSignIn();
                      },
                      controller: googleController,
                      successColor: Colors.green,
                      elevation: 0,
                      color: Colors.black38,
                      borderRadius: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(Config.google),
                            width: 30,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("Sign in with Google",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  Image(
                    image: AssetImage(Config.more_option),
                    width: 300,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // facebook login button
                  RoundedLoadingButton(
                    onPressed: () {
                      handleFacebookAuth();
                    },
                    controller: facebookController,
                    successColor: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.80,
                    elevation: 0,
                    borderRadius: 10,

                    color: Colors.blue,
                    child: Wrap(
                      children: const [
                        Icon(
                          FontAwesomeIcons.facebook,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Sign in with Facebook",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // twitter loading button
                  RoundedLoadingButton(
                    onPressed: () {
                      handleTwitterAuth();
                    },
                    controller: twitterController,
                    successColor: Colors.lightBlue,
                    width: MediaQuery.of(context).size.width * 0.80,
                    elevation: 0,
                    borderRadius: 10,
                    color: Colors.lightBlue,
                    child: Wrap(
                      children: const [
                        Icon(
                          FontAwesomeIcons.twitter,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Continue with Twitter",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  Text("Don't Have an Acount?", style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
                  const SizedBox(
                    height: 10,
                  ),
                  // phoneAuth loading button
                  SizedBox(
                    width: 300,
                    child: RoundedLoadingButton(
                      onPressed: () {
                        nextScreenReplace(context, const PhoneAuthScreen());
                        phoneController.reset();
                      },
                      controller: phoneController,
                      successColor: Colors.black,
                      elevation: 0,
                      borderRadius: 10,
                      color: HexColor(ColoR.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          Icon(
                            Icons.account_circle_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Sign up",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
              SizedBox(
                height: 20,),
                  Text("By signing up, you agree to our \n terms of Service and Privacy policy",style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // handling twitter auth
  Future handleTwitterAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithTwitter().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          twitterController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        twitterController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        twitterController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handling google sigin in
  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handling facebookauth
  // handling google sigin in
  Future handleFacebookAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      facebookController.reset();
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          facebookController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handle after signin
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context,  BottomNavBar());
    });
  }
}
