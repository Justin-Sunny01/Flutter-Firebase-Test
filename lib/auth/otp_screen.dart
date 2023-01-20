import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  final String? mobileNumber;
  final String? verificationId;
  final String flavor;
  const OtpScreen({
    super.key,
    required this.mobileNumber,
    required this.verificationId,
    required this.flavor,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otp;

  @override
  void initState() {
    _listenCode();
    super.initState();
  }

  void _listenCode() async {
    String code = await SmsAutoFill().getAppSignature;
    debugPrint("Signature: $code");
    await SmsAutoFill().listenForCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LottieBuilder.asset(
                  "assets/lottie/otp.json",
                  height: size.height * 0.3,
                  width: size.width,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 55,
                ),
                const Text(
                  "Verify your phone number",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "We have sent a verification code to"
                  "\n${widget.mobileNumber}",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                PinFieldAutoFill(
                  decoration: const BoxLooseDecoration(
                    strokeColorBuilder: FixedColorBuilder(Colors.black),
                  ),
                  currentCode: otp,
                  cursor: Cursor(color: Colors.blue),
                  autoFocus: true,
                  onCodeSubmitted: (code) {
                    otp = code;
                  },
                  onCodeChanged: (code) {
                    if (code?.length == 6) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                    if (code != null && code != "") {
                      otp = code;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _listenCode();
                    // if (otp != null) {
                    //   bool isOtpVerfied = await verifyOTP(
                    //       otp: otp!, verificationId: widget.verificationId);
                    //   if (isOtpVerfied) {
                    //     // ignore: use_build_context_synchronously
                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => App(flavor: widget.flavor),
                    //       ),
                    //     );
                    //   }
                    // }
                  },
                  child: const Center(
                    child: Text('Verify'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> verifyOTP(
      {required String otp, required String? verificationId}) async {
    try {
      final auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId ?? "", smsCode: otp);
      await auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
