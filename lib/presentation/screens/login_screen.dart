import 'package:bank_app/presentation/widgets/social_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [const BodyWidget()]));
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 600
                ? (constraints.maxWidth - 600) / 2 + 24
                : 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Sign In',
                //AppLocalizations.of(context)!.welcome,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Poppins",
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  // hintText:
                  //     'Email Address', //AppLocalizations.of(context)!.email,
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Poppins",
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  // hintText:
                  //     'Password', //AppLocalizations.of(context)!.password,
                  border: UnderlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              const Text(
                'Forgot password?',
                //AppLocalizations.of(context)!.forgot_password,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF006FFD),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF006FFD)),
                ),
                child: const Text(
                  'Login', //AppLocalizations.of(context)!.login,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member', //AppLocalizations.of(context)!.notAMember
                  ),
                  //Image.asset(Assets.loginBackground, width: 16, height: 16),
                  InkWell(
                    onTap: () {
                      print('Navigate to registration page');
                    },
                    child: const Text(
                      'Register now', //AppLocalizations.of(context)!.registerNow,
                      style: TextStyle(
                        color: Color(0xFF006FFD),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: RichText(
              //     text: TextSpan(
              //       text: AppLocalizations.of(context)!.notAMember,
              //       style: TextStyle(color: Colors.black, fontSize: 14),
              //       children: [
              //         TextSpan(
              //           text: AppLocalizations.of(context)!.registerNow,
              //           recognizer: TapGestureRecognizer()
              //             ..onTap = () {
              //               print('Navigate to registration page');
              //             },
              //           style: TextStyle(
              //             color: Color(0xFF006FFD),
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              const Text(
                'Or continue with...', //AppLocalizations.of(context)!.continueWith,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const SocialRow(),
            ],
          ),
        );
      },
    );
  }
}

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialWidget.google(),
        const SizedBox(width: 12),
        SocialWidget.apple(),
        const SizedBox(width: 12),
        SocialWidget.facebook(),
      ],
    );
  }
}
