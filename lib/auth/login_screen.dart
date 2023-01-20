import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_test_app/auth/otp_screen.dart';
import 'package:flutter_firebase_test_app/auth/phone_text_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  final String flavor;

  const LoginScreen({
    super.key,
    required this.flavor,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.width * 0.4,
              ),
              LottieBuilder.asset(
                "assets/lottie/login.json",
                height: size.height * 0.3,
                width: size.width,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: size.width * 0.2,
              ),
              PhoneTextField(onPhoneNumberChange: (PhoneNumber num) {
                debugPrint(num.completeNumber);
                setState(() => phoneNumber = num.completeNumber);
              }),
              SizedBox(
                height: size.width * 0.2,
              ),
              ElevatedButton(
                onPressed: () async {
                  await _verifyPhoneNumber(
                    phoneNumber: phoneNumber,
                  );
                },
                child: const Center(
                  child: Text('Get OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber({required String? phoneNumber}) async {
    final auth = FirebaseAuth.instance;
    try {
      if (phoneNumber != null) {
        await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            final snackBar = SnackBar(
              content: Text(e.toString()),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          codeSent: (String verificationId, int? resendToken) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  mobileNumber: phoneNumber,
                  verificationId: verificationId,
                  flavor: widget.flavor,
                ),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
